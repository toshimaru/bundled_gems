# frozen_string_literal: true

require 'thor'

module BundledGem
  class Cli < Thor
    desc "list", "bundle list(without bundle install)"
    def list
      gemfilelock_content = File.read("./Gemfile.lock")
      lockfile = Bundler::LockfileParser.new(gemfilelock_content)
      lockfile.specs.each { |s| puts "#{s.name}, #{s.version}" }
    end
  end
end
