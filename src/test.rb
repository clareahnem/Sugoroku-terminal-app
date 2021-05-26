require "tty-table"
require "colorize"

# one_to_ten = "START|   #{1}  |   #{2}  |   #{3}  |   #{4}  |   #{5}  |   #{6}  |   #{7}  |   #{8}  |   #{9}  |  #{10}  |"
# # ["START", "|   ", 1, "  ", "|   ", 2, "  ", "|   ", 3, "  ", "|   ", 4, "  ","|   ", 5, "  ","|   ", 6, "  ", "|   ", 7, "  ", "|   ", 8, "  ", "|   ", 9, "  ","|  ", 10, "  |" ]
# twelve_to_twentyone = "     |  #{"21".colorize(:green)}  |  #{"20".colorize(:red)}  |  19  |  #{"18".colorize(:green)}  |  #{"17".colorize(:red)}  |  #{"16".colorize(:blue)}  |  15  |  #{"14".colorize(:red)}  |  13  |  12  |"
# twentythree_to_goal = "     |  #{"23".colorize(:red)}  |  24  |  25  |  #{"26".colorize(:green)}  |  #{"27".colorize(:green)}  |  28  |  #{"29".colorize(:red)}  |  30  |  #{"31".colorize(:blue)}  |  #{"32".colorize(:green)}  | GOAL"


one_to_ten = ["START|", "  ■  |", "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:green), "  ■  |", "  ■  |", "  ■  |".colorize(:blue), "  ■  |"]
eleven = ["                                                           |", "  ■  |".colorize(:green)]
twelve_to_twentyone = ["     |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |".colorize(:blue), "  ■  |", "  ■  |".colorize(:red), "  ■  |", "  ■  |"]
twentytwo = ["     |", "  ■  |"]
twentythree_to_goal = ["     |", "  ■  |".colorize(:red), "  ■  |", "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:green), "  ■  |", "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:blue), "  ■  |".colorize(:green), "GOAL"]
puts "     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
one_to_ten.each {|item| print item}
puts "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
eleven.each {|item| print item}
puts "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
twelve_to_twentyone.each {|item| print item}
puts "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
twentytwo.each {|item| print item}
puts "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
twentythree_to_goal.each {|item| print item}
puts "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"



# puts "     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
# puts "START|  ■  |  ■  |  ■  |  ■  |  ■  |  ■  |  ■  |  ■  |  ■  |  ■  |"
# puts "     +------+------+------+------+------+------+------+------+------+------+"
# puts "                                                           | ■11■ |"
# puts "     +------+------+------+------+------+------+------+------+------+------+"
# puts "     | ■21■ | ■20■ | ■19■ | ■18■ | ■17■ | ■16■ | ■15■ | ■14■ | ■13■ | ■12■ |"
# puts "     +------+------+------+------+------+------+------+------+------+------+"
# puts "     | ■22■ |"
# puts "     +------+------+------+------+------+------+------+------+------+------+"
# puts "     | ■23■ | ■24■ | ■25■ | ■26■ | ■27■ | ■28■ | ■29■ | ■30■ | ■31■ | ■32■ | GOAL"
# puts "     +------+------+------+------+------+------+------+------+------+------+"
# if one_to_ten.include? "3"
#     one_to_ten.sub!("3", "3".colorize(:green))
# end
# puts one_to_ten

# colorize_one_to_ten = {
#     3 => :green,
#     4 => :red,
#     6 => :green,
#     9 => :blue}

# def colorize_each_panel(string, hash)
#     hash.each do |number, color|
#         replace = number.to_s.colorize(color)
#         if string.include? number.to_s
#             string = string.sub(/#{number}/, replace)
#         end
#     end
#     puts string
# end

# colorize_each_panel(one_to_ten, colorize_one_to_ten)
