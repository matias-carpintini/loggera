require "loggera/version"
require "loggera/engine"

module Loggera
  ActiveSupport::Notifications.subscribe "process_action.action_controller" do |event|
    event.payload => { exception:, exception_object: }

    if exception
      event.payload => { 
        controller:, action:, status:, params:, path:, method:, format: 
      }
      class_name, message = exception
      title = "#{ class_name =~ /^[aeiou]/i ? 'An' : 'A' } #{ class_name } occurred in #{ controller }##{ action }"
      backtrace = exception_object.backtrace.first
      
      Loggera::Error.create!(
        title:, class_name:, message:, backtrace:, status:, 
        params:, path:, method:, format: 
      )
    end
  end
end