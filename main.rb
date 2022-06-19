# frozen_string_literal: true

require_relative './tree'

# Test drive script
puts 'building new tree..'
my_tree = Tree.new(Array.new(15) { rand(1..100) })
sleep 1
puts "balanced?: #{my_tree.balanced?}"
sleep 1
puts 'printing node data...'
puts 'level-order:'
my_tree.level_order { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'preorder:'
my_tree.preorder { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'postorder:'
my_tree.postorder { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'in-order:'
my_tree.in_order { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'inserting some nodes to umbalance the tree'
8.times { |num| my_tree.insert(101 + num) }
sleep 1
puts "balanced: #{my_tree.balanced?}"
sleep 1
puts 'rebalancing tree...'
my_tree.rebalance
sleep 1
puts "balanced?: #{my_tree.balanced?}"
sleep 1
puts 'printing node data...'
puts 'level-order:'
my_tree.level_order { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'preorder:'
my_tree.preorder { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'postorder:'
my_tree.postorder { |n| print "#{n.data} " }
puts "\n"
sleep 1
puts 'in-order:'
my_tree.in_order { |n| print "#{n.data} " }
puts "\n"

puts "\nprinting entire tree...\n"
sleep 1
my_tree.pretty_print

puts 'test completed...'
