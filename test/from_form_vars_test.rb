# encoding: UTF-8

# This test is not complete, most of OpenURL was written without tests,
# just adding tests as we fix bugs or change things. 

Encoding.default_external = "UTF-8" if defined? Encoding

class FromFormVarsTest < Test::Unit::TestCase

  def test_basic_0_1_book
    co = OpenURL::ContextObject.new_from_form_vars("genre" => "book", "title" => "some book", "au" => "some author")

    assert_equal "book", co.referent.format
    assert_equal "book", co.referent.metadata['genre']
    assert_equal "some author", co.referent.metadata['au']
    assert_equal "some book", co.referent.metadata['title']
  end

  def test_wrong_case_0_1_book
    co = OpenURL::ContextObject.new_from_form_vars("genre" => "Book", "title" => "some book", "au" => "some author")

    assert_equal "book", co.referent.format
    assert_equal "Book", co.referent.metadata['genre']
    assert_equal "some author", co.referent.metadata['au']
    assert_equal "some book", co.referent.metadata['title']
  end

  def test_0_1_dissertation
    co = OpenURL::ContextObject.new_from_form_vars("genre" => "dissertation", "title" => "some book", "au" => "some author")

    assert_equal "dissertation", co.referent.format
    assert_equal "dissertation", co.referent.metadata['genre']
    assert_equal "some author", co.referent.metadata['au']
    assert_equal "some book", co.referent.metadata['title']
  end

end