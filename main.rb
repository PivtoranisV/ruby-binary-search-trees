# frozen_string_literal: true

require_relative 'lib/tree'

test_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test_tree.pretty_print
test_tree.insert(2)
test_tree.insert(6)
test_tree.insert(4)
test_tree.insert(400)
test_tree.pretty_print
test_tree.delete(400)
test_tree.delete(6345)
test_tree.delete(1111)
test_tree.pretty_print
p test_tree.find(324)

p test_tree.level_order_iterative
p test_tree.preorder
p test_tree.inorder
