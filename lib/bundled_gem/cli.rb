# frozen_string_literal: true

require "open3"
require "thor"

module BundledGem
  # bundled_gem CLI class powered by thor
  class Cli < Thor
    desc "install [BUNDLED_GEM]", "install [BUNDLED_GEM] specified in `Gemfile.lock`"
    option "lockfile", type: :string, default: LOCKFILE, desc: "Use the specified gemfile.lock instead of Gemfile.lock"
    def install(*bundled_gems)
      abort "Please specify at least one gem name (e.g. gem build GEMNAME)" if bundled_gems.empty?

      reader = LockfileReader.new(lockfile: options[:lockfile])
      bundled_gems.each do |bundled_gem|
        if reader.gem_listed?(bundled_gem)
          version = reader.get_version(bundled_gem)
          command = "gem install #{bundled_gem}:#{version}"
          IO.popen(command) do |f|
            while line = f.gets
              puts line
            end
          end
        else
          warn "`#{bundled_gem}` is not listed in Gemfile.lock."
        end
      end
    end

    # TODO: create i command for aliasing install

    desc "list", "bundle list without `bundle install`"
    option "lockfile", type: :string, default: LOCKFILE, desc: "Use the specified gemfile.lock instead of Gemfile.lock"
    def list
      puts "Gems included in `#{options[:lockfile]}`:"
      LockfileReader.new(lockfile: options[:lockfile]).lockfile_specs.each do |spec|
        puts "  * #{spec.name}, #{spec.version}"
      end
    end

    desc "version", "bundled_gems version"
    def version
      puts ::BundledGem::VERSION
    end
  end
end
