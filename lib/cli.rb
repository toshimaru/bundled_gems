# frozen_string_literal: true

require 'thor'

class Cli < Thor
  desc "list", "bundle list(without bundle install)"
  def list
    puts "bundle list"
  end
end
