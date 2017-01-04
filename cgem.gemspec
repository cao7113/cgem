# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cgem/version'

Gem::Specification.new do |spec|
  spec.name          = "cgem"
  spec.version       = Cgem::VERSION
  spec.authors       = ["Ruijian Cao"]
  spec.email         = ["cao7113@hotmail.com"]

  spec.summary       = %q{Change gem sources easily!}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/cao7113/cgem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "thor"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
