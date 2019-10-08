# frozen_string_literal: true

require "test_helper"
require 'bundled_gem/cli'

module BundledGem
  class CliTest < Minitest::Test
    def test_intall
    end

    def test_list
      out, err = capture_io { BundledGem::Cli.start(['list']) }
      assert_empty err
      assert out.include?("Gems included in `Gemfile.lock`:")
    end
  end
end
