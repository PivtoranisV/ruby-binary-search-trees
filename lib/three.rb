# frozen_string_literal: true

require_relative 'node'

class Three
  attr_accessor :root

  def initialize(data)
    @root = build_tree(data)
  end

  def build_tree(arr)
  end
end
