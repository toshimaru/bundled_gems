# frozen_string_literal: true

require "test_helper"

class BundledGemTest < Minitest::Test
  def setup
    @reader = ::BundledGem::LockfileReader.new
  end

  def test_gem_listed_true
    assert @reader.gem_listed?("rake")
  end

  def test_gem_listed_false
    refute @reader.gem_listed?("not_listed_gem")
  end

  def test_get_version_not_nil
    refute_nil @reader.get_version("rake")
  end

  def test_get_version_nil
    assert_nil @reader.get_version("not_listed_gem")
  end
end
