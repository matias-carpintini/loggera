require_relative "lib/loggera/version"

Gem::Specification.new do |spec|
  spec.name        = "loggera"
  spec.version     = Loggera::VERSION
  spec.authors     = [""]
  spec.email       = ["carpintinimatias@gmail.com"]
  spec.homepage    = "https://github.com/matiascarpintini/loggera"
  spec.summary     = "Summary of Loggera."
  spec.description = "Description of Loggera."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matiascarpintini/loggera"
  spec.metadata["changelog_uri"] = "https://github.com/matiascarpintini/loggera/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end
