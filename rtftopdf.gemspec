# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtftopdf/version'

Gem::Specification.new do |spec|
  spec.name          = "rtftopdf"
  spec.version       = Rtftopdf::VERSION
  spec.authors       = ["Caleb Cauthon"]
  spec.email         = ["calebcauthon@gmail.com"]
  spec.description   = %q{RTF to PDF conversion}
  spec.summary       = %q{Converts rtf strings to pdf output using unrtf and wkhtmltopdf.}
  spec.homepage      = "http://github.com/calebcauthon/rtftopdf"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7.3"
end
