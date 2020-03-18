extends 'res://addons/gut/test.gd'



class TestFoobar:
    extends 'res://addons/gut/test.gd'

    func test_foo():
        assert_true(true)

    func test_bar():
        assert_false(false)


class TestBarFooar:
    extends 'res://addons/gut/test.gd'

    func test_one():
        assert_true(true)

    func test_two():
        assert_false(false)