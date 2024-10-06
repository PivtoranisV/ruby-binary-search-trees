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
end
