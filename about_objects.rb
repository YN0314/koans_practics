require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object
    #assert_equal __, 1.is_a?(Object)
    assert_equal true, 1.is_a?(Object)
    #assert_equal __, 1.5.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    #assert_equal __, "string".is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    #assert_equal __, nil.is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    #assert_equal __, Object.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    #assert_equal __, 123.to_s
    assert_equal "123", 123.to_s
    #assert_equal __, nil.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected
    #assert_equal __, 123.inspect
    assert_equal "123", 123.inspect
    #assert_equal __, nil.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    #assert_equal __, obj.object_id.class
    assert_equal Integer, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    #assert_equal __, obj.object_id != another_obj.object_id
    assert_equal true, obj.object_id != another_obj.object_id
  end

  def test_small_integers_have_fixed_ids
    #assert_equal __, 0.object_id
    assert_equal 1, 0.object_id
    #assert_equal __, 1.object_id
    assert_equal 3, 1.object_id
    #assert_equal __, 2.object_id
    assert_equal 5, 2.object_id
    #assert_equal __, 100.object_id
    assert_equal 201, 100.object_id

    # The object_id is 2byte plus 1 that Integer class has.

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  # Test inner class
  class Human
    def initialize(name)
      @name = name
    end

    def display_name
      puts @name
    end
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    #assert_equal __, obj           != copy
    assert_equal true, obj           != copy
    #assert_equal __, obj.object_id != copy.object_id
    assert_equal true, obj.object_id != copy.object_id

    a = Human.new("taro")
    b = a.clone

    assert_equal true, a.display_name == b.display_name, "generated object has same properties."

    # clone method generate other object, but objects has same properties.
  end
end
