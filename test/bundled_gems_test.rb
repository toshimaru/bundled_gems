require "test_helper"

class BundledGemTest < Minitest::Test
  def setup
    @reader = ::BundledGem::LockfileReader.new
  end
  
  def test_that_it_has_a_version_number
    assert @reader.gem_listed?('rake')
  end

  def test_that_it_has_a_version_number
    refute @reader.gem_listed?('not_listed_gem')
  end
end
