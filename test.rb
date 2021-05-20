scoreboard = {
    "test1" => 100,
    "test2" => -300,
    "test3" => 700,
    "test4" => 800,
    "test5" => 7900,
    "test6" => 1000,
}

scoreboard.store("test7", 700)

ranking = scoreboard.sort_by {|key, value| value}.reverse.to_h

i = 1
ranking.each do |key, value|
    case i
    when 1
        puts "1st: #{key}, #{value}pts"
    when 2
        puts "2nd: #{key}, #{value}pts"
    when 3
        puts "3rd: #{key}, #{value}pts"
    else
        puts "#{i}th: #{key}, #{value}pts"
    end
    i += 1
end

