# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundled_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "bundled_gems"
  spec.version       = BundledGem::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = "Install gem specified in Gemfile.lock without `bundle install`"
  spec.description   = "Install gem specified in Gemfile.lock without `bundle install`"

  spec.homepage      = "https://github.com/toshimaru/bundled_gems"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/toshimaru/bundled_gems"
  spec.metadata["changelog_uri"] = "https://github.com/toshimaru/bundled_gems/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = %w[bgem]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "bundler"
  spec.add_dependency "thor"
end
