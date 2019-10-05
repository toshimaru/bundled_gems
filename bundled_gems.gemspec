lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundled_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "bundled_gems"
  spec.version       = BundledGem::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{BundledGems}
  spec.description   = %q{BundledGems}
  spec.homepage      = "https://github.com/toshimaru/bundled_gems"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/toshimaru/bundled_gems"
  spec.metadata["changelog_uri"] = "https://github.com/toshimaru/bundled_gems"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "thor"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
