#frozen_string_literal: true

require_relative './node'

#creates trees
class Tree
  def initialize src_array
    @root = nil
    @scr_array = scr_array
  end

  def build_tree(arr, start, ending)
    return nil if start > ending

    arr = arr.uniq.sort

    mid = (start + ending) / 2
    node = Node.new([arr[mid]])

    node.left = build_tree(arr, start, mid - 1)
    node.right = build_tree(arr, mid + 1, ending)
    node
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil? 

    value > root.data && root.right = insert(value, root.right)
    value < root.data && root.left = insert(value, root.left)

    root
  end

  def min_value(root)
    min = root.key
    while root.left
      min = root.left.key
      root = root.left
    end
    min
end