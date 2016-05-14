# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mattermost/version'

Gem::Specification.new do |spec|
  spec.name          = 'mattermost-ruby'
  spec.version       = Mattermost::VERSION
  spec.authors       = ['Josh Brody']
  spec.email         = ['josh@josh.mn']
  spec.platform      = Gem::Platform::RUBY
  spec.licenses      = ['MIT']
  spec.authors       = ['Josh Brody']
  spec.summary       = %q{An ActiveModel-inspired API client for Mattermost}
  spec.description   = %q{An ActiveModel-inspired API client for Mattermost}
  spec.homepage      = 'https://github.com/joshmn/mattermost-ruby'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
