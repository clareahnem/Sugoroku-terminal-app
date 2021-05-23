require "tty-table"
require "colorize"

scoreboard = {
    "test1" => 100,
    "test2" => -300,
    "test3" => 700,
    "test4" => 800,
    "test5" => 7900,
    "test6" => 1000,
}

scoreboard.store("test7", 700)

ranking = scoreboard.sort_by {|key, value| value}.reverse

pp ranking

# table = TTY::Table.new(["Rank", "Name", "Score"], ["a", "b", "c"])
# i = 1
# ranking.each do |one_data|
#     one_data.unshift i
#     i += 1
# end

# pp ranking

# puts table.render(:acsii)


# i = 1
# ranking.each do |key, value|
#     case i
#     when 1
#         puts "1st: #{key}, #{value}pts"
#     when 2
#         puts "2nd: #{key}, #{value}pts"
#     when 3
#         puts "3rd: #{key}, #{value}pts"
#     else
#         puts "#{i}th: #{key}, #{value}pts"
#     end
#     i += 1
# end

#teat ID 12-2
# table = TTY::Table.new(["Rank","Name","Score"], ranking)
# puts table.render(:ascii)
pp String.color_samples   