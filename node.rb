# frozen_string_literal: true

# creates nodes
class Node
  attr_accessor :data, :left, :right

  include 'comparable'

  def initialize data
    @data = data
    @left = nil
    @right = nil
  end
end