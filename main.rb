# frozen_string_literal: true

require_relative 'lib/tree'

test_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test_tree.pretty_print
test_tree.insert(2)
test_tree.insert(6)
test_tree.insert(4)
test_tree.pretty_print
