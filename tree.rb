#frozen_string_literal: true

require_relative './node'

#creates trees
class Tree
  def initialize src_array
    @src_array = src_array
    @root = build
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

  def delete(value, root = @root)
    return nil if root.nil

    value > root.data && root.right = delete(value, root.right)
    value < root.data && root.left = delete(value, root.left)

    if value == root.data
      return root.right unless root.left
      return root.left unless root.right

      root.value = min_value(root.right)

      root.right = delete(root.value, root.right)
    end
    root
  end

  def find(value, root = @root)
    return nil unless root

    new_val ||= ""

    value > root.data && new_val = find(value, root.right)
    value < root.data && new_val = find(value, root.left)
    new_val = root if value == root.data
    new_val
  end

  private

  def build
   len = @src_array.length - 1
   root_node = build_tree(@src_array, 0, len)
   root_node
  end

  def min_value(root)
    min = root.data
    while root.left
      min = root.left.data
      root = root.left
    end
    min
  end
end
