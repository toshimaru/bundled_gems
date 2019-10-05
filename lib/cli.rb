# frozen_string_literal: true

require 'thor'

class Cli < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name)
    puts "Hello #{name}"
  end
end
