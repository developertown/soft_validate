$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "soft_validate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "soft_validate"
  s.version     = SoftValidate::VERSION
  s.authors     = ["David Christiansen", "Jason Vasquez"]
  s.email       = ["dave@developertown.com", "jason.vasquez@developertown.com"]
  s.homepage    = "https://github.com/developertown/soft_validate"
  s.summary     = "Makes it easy to suggest that certain fields be provided, LinkedIn profile style"
  s.description = "Add softs_validate_presence_of :attr to your model and it will give you methods to figure out percent complete, missing fields, etc without preventing the record from being saved."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
