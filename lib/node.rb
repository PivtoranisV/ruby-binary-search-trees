# frozen_string_literal: true

# The Node class represents an individual node in a Binary Search Tree (BST).
# Each node holds a data value, and references to its left and right child nodes.
#
# The Node class includes the Comparable module to allow nodes to be compared based
# on their data values.
#
# Attributes:
# - @data: Stores the value contained within the node.
# - @left: References the left child node (which holds a value less than the current node's data).
# - @right: References the right child node (which holds a value greater than the current node's data).
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    @data <=> other.data
  end
end
