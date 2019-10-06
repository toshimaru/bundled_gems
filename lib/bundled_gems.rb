# frozen_string_literal: true

require 'bundler'
require "bundled_gem/version"

module BundledGem
  LOCKFILE = "Gemfile.lock"

  class LockfileReader
    def initialize(lockfile: LOCKFILE)
      abort "No such file: #{lockfile}" unless File.exist?(lockfile)
      @lockfile_content = File.read(lockfile)
    end

    # Parse `Gemfile.lock` and Retrieve specs
    def lockfile_specs
      lockfile.specs
    end

    # Get version info from `Gemfile.lock`
    def get_version(gem)
      lockfile_specs.find{ |s| s.name == gem }&.version
    end

    # Check gem is listed in `Gemfile.lock`
    def gem_listed?(gem)
      lockfile_specs.map(&:name).include? gem
    end

    private

    def lockfile
      @lockfile ||= ::Bundler::LockfileParser.new(@lockfile_content)
    end
  end
end
