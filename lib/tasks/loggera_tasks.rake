task :tailwind_engine_watch do
  require 'tailwindcss-rails'
  # NOTE: tailwindcss-rails is an engine
  system "#{Tailwindcss::Engine.root.join("exe/tailwindcss")} \
         -i #{Loggera::Engine.root.join("app/assets/stylesheets/loggera/application.tailwind.css")} \
         -o #{Loggera::Engine.root.join("app/assets/builds/loggera.css")} \
         -c #{Loggera::Engine.root.join("config/tailwind.config.js")} \
         --minify -w"
end