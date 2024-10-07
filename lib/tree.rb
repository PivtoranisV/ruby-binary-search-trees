# frozen_string_literal: true

require_relative 'node'

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

  #  iterative solution
  # def insert(value)
  #   new_node = Node.new(value)
  #   current_node = root
  #   leaf = nil

  #   while current_node
  #     leaf = current_node
  #     current_node = if new_node < current_node
  #                      current_node.left
  #                    elsif new_node > current_node
  #                      current_node.right
  #                    else
  #                      return # Value already exists, do nothing
  #                    end
  #   end

  #   # At this point, `leaf` should be the parent node of `new_node`
  #   if new_node < leaf
  #     leaf.left = new_node
  #   else
  #     leaf.right = new_node
  #   end
  # end

  # Recursive solution
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
end
