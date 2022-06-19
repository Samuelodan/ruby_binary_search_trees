# frozen_string_literal: true

require_relative './tree'

# Test drive script
puts "building new tree.."
my_tree = Tree.new(Array.new(15) { rand(1..100) })
puts "balanced: #{my_tree.balanced?}"
puts 'level-order:'
my_tree.level_order { |n| print "#{n.data} " }
puts "\n"
puts 'preorder:'
my_tree.preorder { |n| print "#{n.data} " }
puts "\n"
puts 'postorder:'
my_tree.postorder { |n| print "#{n.data} " }
puts "\n"
puts 'in-order:'
my_tree.in_order { |n| print "#{n.data} " }
puts "\n"

puts 'insert some nodes to umbalance the tree'
8.times { |num| my_tree.insert(101 + num) }
puts "balanced: #{my_tree.balanced?}"

puts 'rebalance tree...'
my_tree.rebalance

puts "balanced: #{my_tree.balanced?}"

puts 'level-order:'
my_tree.level_order { |n| print "#{n.data} " }
puts "\n"
puts 'preorder:'
my_tree.preorder { |n| print "#{n.data} " }
puts "\n"
puts 'postorder:'
my_tree.postorder { |n| print "#{n.data} " }
puts "\n"
puts 'in-order:'
my_tree.in_order { |n| print "#{n.data} " }
puts "\n"
