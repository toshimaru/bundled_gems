# frozen_string_literal: true

require 'thor'

module BundledGem
  class Cli < Thor
    desc "install [BUNDLED_GEM]", "install [BUNDLED_GEM] from `Gemfile.lock`"
    def install(bundled_gem)
      reader = LockfileReader.new
      puts "`#{bundled_gem}` is not listed in Gemfile.lock." unless reader.gem_listed?(bundled_gem)
    end

    desc "list", "bundle list without `bundle install`"
    def list
      puts "Gems included in `Gemfile.lock`:"
      LockfileReader.new.lockfile_specs.each do |s| 
        puts "  * #{s.name}, #{s.version}" 
      end
    end
  end
end
