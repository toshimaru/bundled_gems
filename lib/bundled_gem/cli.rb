# frozen_string_literal: true

require 'thor'

module BundledGem
  class Cli < Thor
    desc "install [BUNDLED_GEM]", "install [BUNDLED_GEM] from `Gemfile.lock`"
    option "lockfile", type: :string, desc: "Use the specified gemfile.lock instead of Gemfile.lock"
    def install(bundled_gem)
      reader = LockfileReader.new
      if reader.gem_listed?(bundled_gem)
        version = reader.get_version(bundled_gem)
        system "gem install #{bundled_gem} --version #{version}"
      else
        abort "`#{bundled_gem}` is not listed in Gemfile.lock." 
      end
    end

    desc "list", "bundle list without `bundle install`"
    def list
      puts "Gems included in `Gemfile.lock`:"
      LockfileReader.new.lockfile_specs.each do |s| 
        puts "  * #{s.name}, #{s.version}" 
      end
    end

    desc "version", "bundled_gems version"
    def version
      puts ::BundledGem::VERSION
    end
  end
end
