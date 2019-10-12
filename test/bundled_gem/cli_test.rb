# frozen_string_literal: true

require "test_helper"
require 'bundled_gem/cli'

module BundledGem
  class CliTest < Minitest::Test
    def test_intall_with_no_arg
      out, err = capture_io do
        begin
          BundledGem::Cli.start(['install']) 
        rescue SystemExit
        end
      end
      assert_empty out
      assert_match(/Please specify at least one gem name \(e\.g\. gem build GEMNAME\)/, err)
    end

    def test_intall_with_arg
      out, err = capture_io { BundledGem::Cli.start(['install', 'rake']) }
      assert_empty out
      assert_empty err
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
