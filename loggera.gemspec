require_relative "lib/loggera/version"

Gem::Specification.new do |spec|
  spec.name        = "loggera"
  spec.version     = Loggera::VERSION
  spec.authors     = ["Matias Carpintini"]
  spec.email       = ["carpintinimatias@gmail.com"]
  spec.homepage    = "https://github.com/matiascarpintini/loggera"
  spec.summary     = "Simple, efficient Rails engine to handle errors on production through a client-friendly UI."
  spec.description = "Simple, efficient Rails engine to handle errors on production through a client-friendly UI."
  spec.license     = "MIT"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matiascarpintini/loggera"
  spec.metadata["changelog_uri"] = "https://github.com/matiascarpintini/loggera/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
end
