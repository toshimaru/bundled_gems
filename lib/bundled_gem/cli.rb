# frozen_string_literal: true

require 'thor'

module BundledGem
  class Cli < Thor
    desc "install [BUNDLED_GEM]", "install [BUNDLED_GEM] from `Gemfile.lock`"
    def install(bundled_gem)
      # TODO
    end

    desc "list", "bundle list without `bundle install`"
    def list
      LockfileReader.new.lockfile_specs.each { |s| puts "#{s.name}, #{s.version}" }
    end
  end
end
