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

end