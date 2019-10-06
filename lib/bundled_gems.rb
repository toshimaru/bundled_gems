# frozen_string_literal: true

require 'bundler'
require "bundled_gem/version"

module BundledGem
  class LockfileReader
    LOCKFILE = "Gemfile.lock"

    def initialize(lockfile: LOCKFILE)
      @lockfile = lockfile
    end

    def lockfile_specs
      lockfile_content = File.read(@lockfile)
      lockfile = ::Bundler::LockfileParser.new(lockfile_content)
      lockfile.specs
    end
  end
end
