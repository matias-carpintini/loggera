require 'pagy'

module Loggera
  class Engine < ::Rails::Engine
    isolate_namespace Loggera

    initializer "loggera.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/assets/javascripts")
    end

    initializer "loggera.assets" do |app|
      app.config.assets.precompile += %w[loggera_manifest]
    end
  end
end
