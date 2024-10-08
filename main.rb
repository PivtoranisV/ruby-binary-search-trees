# frozen_string_literal: true

require_relative 'lib/tree'

def driver
  bst = Tree.new((Array.new(15) { rand(1..100) }))
  puts 'Tree is Balanced' if bst.balanced?
  puts 'Level-order Traversal:'
  p bst.level_order_iterative
  puts 'Pre-order Traversal:'
  p bst.preorder
  puts 'In-order Traversal:'
  p bst.inorder
  puts 'Post-order Traversal:'
  p bst.postorder
  bst.insert(rand(200..300))
  bst.insert(rand(200..300))
  bst.insert(rand(200..300))
  puts 'Tree is Unbalanced' unless bst.balanced?
  bst.rebalance
  puts 'Tree is Balanced again' if bst.balanced?
  puts 'Level-order Traversal:'
  p bst.level_order_iterative
  puts 'Pre-order Traversal:'
  p bst.preorder
  puts 'In-order Traversal:'
  p bst.inorder
  puts 'Post-order Traversal:'
  p bst.postorder
end

driver
