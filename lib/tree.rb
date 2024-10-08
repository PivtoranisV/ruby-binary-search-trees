# frozen_string_literal: true

require_relative 'node'

# The Tree class represents a Binary Search Tree (BST) structure.
# It supports various operations such as insertion, deletion, traversal,
# and checking balance of the tree.
class Tree
  attr_accessor :root

  def initialize(data)
    @root = build_tree(data.uniq.sort)
  end

  def build_tree(sorted_array)
    return nil if sorted_array.empty?

    mid = sorted_array.size / 2

    root_node = Node.new(sorted_array[mid])

    root_node.left = build_tree(sorted_array[...mid])
    root_node.right = build_tree(sorted_array[mid + 1..])

    root_node
  end

  # to visualize your binary search tree
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, leaf = root)
    new_node = Node.new(value)

    if leaf.nil?
      return new_node
    elsif new_node == leaf
      return leaf # Do nothing if the value already exists in the tree
    elsif new_node < leaf
      leaf.left = insert(value, leaf.left)
    else
      leaf.right = insert(value, leaf.right)
    end

    leaf
  end

  def delete(value, leaf = root)
    return leaf if leaf.nil?

    if value < leaf.data
      leaf.left = delete(value, leaf.left)
    elsif value > leaf.data
      leaf.right = delete(value, leaf.right)

    # If the value is equal to the leaf's data, this is the node to be deleted
    else

      # Case 1: Node with only one child or no child
      if leaf.left.nil?
        return leaf.right
      elsif leaf.right.nil?
        return leaf.left
      end

      # Case 2: Node with two children
      # Find the in-order successor (smallest in the right subtree)
      min_larger_node = find_min(leaf.right)

      # Replace the current node's value with the in-order successor's value
      leaf.data = min_larger_node.data

      # Recursively delete the in-order successor
      leaf.right = delete(min_larger_node.data, leaf.right)
    end

    leaf
  end

  def find(value, leaf = root)
    return nil if leaf.nil?

    if value < leaf.data
      find(value, leaf.left)
    elsif value > leaf.data
      find(value, leaf.right)
    else
      leaf # Return the node if the value matches
    end
  end

  def level_order_iterative
    return [] if root.nil?

    queue = [root]
    result = []

    until queue.empty?
      current_node = queue.shift
      if block_given?
        yield(current_node)
      else
        result << current_node.data
      end

      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
    end

    result unless block_given?
  end

  def preorder(current_node = root, result = [], &block)
    # root -> left -> right

    return if current_node.nil?

    if block_given?
      yield(current_node)
    else
      result << current_node.data
    end

    preorder(current_node.left, result, &block)
    preorder(current_node.right, result, &block)

    result unless block_given?
  end

  def inorder(current_node = root, result = [], &block)
    # left -> root -> right

    return if current_node.nil?

    inorder(current_node.left, result, &block)
    if block_given?
      yield(current_node)
    else
      result << current_node.data
    end

    inorder(current_node.right, result, &block)

    result unless block_given?
  end

  def postorder(current_node = root, result = [], &block)
    # left -> right -> root

    return if current_node.nil?

    postorder(current_node.left, result, &block)
    postorder(current_node.right, result, &block)
    if block_given?
      yield(current_node)
    else
      result << current_node.data
    end

    result unless block_given?
  end

  def height(node = root)
    return -1 if node.nil?

    left = height(node.left)
    right = height(node.right)
    [left, right].max + 1
  end

  def depth(node, current_node = root)
    return 0 if current_node == node

    if node < current_node
      depth(node, current_node.left) + 1
    elsif node > current_node
      depth(node, current_node.right) + 1
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    sorted_elements = inorder

    @root = build_tree(sorted_elements)
  end

  private

  def find_min(leaf)
    current = leaf
    current = current.left until current.left.nil? # Go as left as possible
    current
  end
end
