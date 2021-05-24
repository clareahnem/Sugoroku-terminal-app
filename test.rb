require "tty-table"
require "colorize"

one_to_ten = "START|   1  |   2  |   #{"3".colorize(:green)}  |   #{"4".colorize(:red)}  |   5  |   #{"6".colorize(:green)}  |   7  |   8  |   #{"9".colorize(:blue)}  |  10  |"
twelve_to_twentyone = "     |  #{"21".colorize(:green)}  |  #{"20".colorize(:red)}  |  19  |  #{"18".colorize(:green)}  |  #{"17".colorize(:red)}  |  #{"16".colorize(:blue)}  |  15  |  #{"14".colorize(:red)}  |  13  |  12  |"
twentythree_to_goal = "     |  #{"23".colorize(:red)}  |  24  |  25  |  #{"26".colorize(:green)}  |  #{"27".colorize(:green)}  |  28  |  #{"29".colorize(:red)}  |  30  |  #{"31".colorize(:blue)}  |  #{"32".colorize(:green)}  | GOAL"

puts one_to_ten.sub("6", "●")
# puts twelve_to_twentyone.sub("16", "●")
puts twentythree_to_goal.sub("29", "●")