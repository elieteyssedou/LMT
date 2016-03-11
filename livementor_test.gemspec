# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'livementor_test/version'

Gem::Specification.new do |spec|
  spec.name          = "livementor_test"
  spec.version       = LivementorTest::VERSION
  spec.authors       = ["Elie Teyssedou"]
  spec.email         = ["elieteyssedou@gmail.com"]

  spec.summary       = "LiveMentor Test"
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

  spec.files = ["bin/livementor_test",
                "lib/livementor_test.rb",
                "lib/livementor_test/cli.rb",
                "lib/livementor_test/version.rb"
               ]
  spec.executables   = ["livementor_test"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
