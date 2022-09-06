require "loggera/version"
require "loggera/engine"

module Loggera
  # strip the Rails.root prefix from backtrace
  def clean_backtrace(exception)
    Rails.backtrace_cleaner.send(:filter, exception.backtrace)
  end

  # ```
  # * app/controllers/my_controller.rb:99:in `specific_function'
  # * app/controllers/my_controller.rb:70:in `specific_param'
  # * app/controllers/my_controller.rb:53:in `my_controller_params'
  # ```
  def backtrace_message(exception)
    backtrace = exception.backtrace ? clean_backtrace(exception) : nil

    return unless backtrace

    text = []

    text << '```'
    backtrace.first(3).each { |line| text << "* #{line}" }
    text << '```'

    text.join("\n")
  end

  # A RuntimeError occurred in SimulateController#failure
  def title(class_name, controller, action)
    errors_text = class_name =~ /^[aeiou]/i ? 'An' : 'A'
    controller_and_action = "#{ controller }##{ action }"
    occurred_in = "occurred in #{ controller_and_action }"
    
    return [errors_text, class_name, occurred_in].join(" ")
  end

  module_function :clean_backtrace, :backtrace_message, :title

  # Using the Instrumentation API to get notified when
  # error events occur inside the main application. For further
  # information see https://guides.rubyonrails.org/active_support_instrumentation.html
  ActiveSupport::Notifications.subscribe "process_action.action_controller" do |event|
    if event.payload[:exception]
      event.payload => { 
        exception:, exception_object:, controller:, action:, status:, 
        params:, path:, method:, format:
      }
      class_name, message = exception
      backtrace = backtrace_message(exception_object)
      title = title(class_name, controller, action)
      
      # TODO: Group errors
      Loggera::Error.create!(
        title:, class_name:, message:, backtrace:, status:, 
        params:, path:, http_method: method, format: 
      )
    end
  end
end