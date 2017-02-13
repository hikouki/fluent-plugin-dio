# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-dio"
  spec.version       = "1.0.0"
  spec.authors       = ["hikouki"]
  spec.email         = ["koki.higashikawa@crowdworks.co.jp"]

  spec.summary       = %q{Output filter plugin of fluentd. Convert to timestamp from date string.}
  spec.description   = %q{Output filter plugin of fluentd. Convert to timestamp from date string.}
  spec.homepage      = "https://github.com/hikouki/fluent-plugin-dio"
  spec.has_rdoc       = false
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.1'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.1.0"
  spec.add_runtime_dependency "fluentd"
end
