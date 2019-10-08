# frozen_string_literal: true

require "test_helper"
require 'bundled_gem/cli'

module BundledGem
  class CliTest < Minitest::Test
    def test_intall
      out, err = capture_io { BundledGem::Cli.start(['install']) }
      assert_empty out
      assert_match(/was called with no arguments/, err)
      assert_match(/install \[BUNDLED_GEM\]/, err)
    end

    def test_list
      out, err = capture_io { BundledGem::Cli.start(['list']) }
      assert_empty err
      assert_match(/Gems included in `Gemfile.lock`:/, out)
    end

    def test_unknown_command
      out, err = capture_io { BundledGem::Cli.start(['unknown']) }
      assert_empty out
      assert_match(/Could not find command "unknown"/, err)
    end
  end
end
