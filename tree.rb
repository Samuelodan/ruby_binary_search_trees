# frozen_string_literal: true

require_relative './node'

# creates trees
class Tree
  def initialize src_array
    @src_array = src_array
    @root = build
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    value > root.data && root.right = insert(value, root.right)
    value < root.data && root.left = insert(value, root.left)

    root
  end

  def delete(value, root = @root)
    return nil if root.nil?

    value > root.data && root.right = delete(value, root.right)
    value < root.data && root.left = delete(value, root.left)

    if value == root.data
      return root.right unless root.left
      return root.left unless root.right

      root.data = min_value(root.right)

      root.right = delete(root.data, root.right)
    end
    root
  end

  def find(value, root = @root)
    return nil unless root

    new_val ||= ''

    value > root.data && new_val = find(value, root.right)
    value < root.data && new_val = find(value, root.left)
    new_val = root if value == root.data
    new_val
  end

  def level_order
    stack = [@root]
    ret_arr = []
    until stack.empty?
      cur_node = stack.first
      cur_node.left && stack << cur_node.left
      cur_node.right && stack << cur_node.right
      yield stack.shift if block_given?
      ret_arr << stack.shift.data unless block_given?
    end
    ret_arr unless block_given?
  end

  def in_order(root = @root, arr = [], &a_block)
    return unless root

    in_order(root.left, arr, &a_block)
    a_block.call root if block_given?
    arr << root.data unless block_given?
    in_order(root.right, arr, &a_block)
    arr unless block_given?
  end

  def preorder(root = @root, arr = [], &a_block)
    return unless root

    a_block.call root if block_given?
    arr << root.data unless block_given?
    preorder(root.left, arr, &a_block)
    preorder(root.right, arr, &a_block)
    arr unless block_given?
  end

  def postorder(root = @root, arr = [], &a_block)
    return unless root

    postorder(root.left, arr, &a_block)
    postorder(root.right, arr, &a_block)
    a_block.call root if block_given?
    arr << root.data unless block_given?
    arr unless block_given?
  end

  def height(value)
    node = find(value)
    node_height(node)
  end

  def depth(value)
    node = find(value)
    node_height(@root) - node_height(node)
  end

  def balanced?
    diff = (node_height(@root.left) - node_height(@root.right)).abs
    diff <= 1
  end

  def rebalance
    arr = preorder
    @root = build_tree(arr, 0, arr.length - 1)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def build_tree(arr, start, ending)
    return nil if start > ending

    mid = (start + ending) / 2
    node = Node.new(arr[mid])

    node.left = build_tree(arr, start, mid - 1)
    node.right = build_tree(arr, mid + 1, ending)
    node
  end

  def build
    arr = @src_array.uniq.sort
    len = arr.length - 1
    build_tree(arr, 0, len)
  end

  def min_value(root)
    min = root.data
    while root.left
      min = root.left.data
      root = root.left
    end
    min
  end

  def node_height(root)
    return -1 unless root

    [node_height(root.left), node_height(root.right)].max + 1
  end
end
