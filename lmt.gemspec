# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lmt/version'

Gem::Specification.new do |spec|
  spec.name          = "lmt"
  spec.version       = LMT::VERSION
  spec.authors       = ["Elie Teyssedou"]
  spec.email         = ["elieteyssedou@gmail.com"]

  spec.summary       = "LiveMentorTest"
  spec.description   = "Tool able to convert Json data to CSV data."
  spec.homepage      = "https://github.com/elieteyssedou/livementor_test"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = ["bin/lmt",
                "lib/lmt.rb",
                "lib/lmt/cli.rb",
                "lib/lmt/version.rb"
               ]
  spec.executables   = ["lmt"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
