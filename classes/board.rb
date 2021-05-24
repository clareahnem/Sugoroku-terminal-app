require "colorize"


class SugorokuBoard

    def initialize 
        @vertical_border = "     +------+------+------+------+------+------+------+------+------+------+"
        @one_to_ten = "START|   1  |   2  |   #{"3".colorize(:green)}  |   #{"4".colorize(:red)}  |   5  |   #{"6".colorize(:green)}  |   7  |   8  |   #{"9".colorize(:blue)}  |  10  |"
        @eleven = "                                                                    |  #{"11".colorize(:green)}  |"
        @twelve_to_twentyone = "     |  #{"21".colorize(:green)}  |  #{"20".colorize(:red)}  |  19  |  #{"18".colorize(:green)}  |  #{"17".colorize(:red)}  |  #{"16".colorize(:blue)}  |  15  |  #{"14".colorize(:red)}  |  13  |  12  |"
        @twentytwo = "     |  22  |"
        @twentythree_to_goal = "     |  #{"23".colorize(:red)}  |  24  |  25  |  #{"26".colorize(:green)}  |  #{"27".colorize(:green)}  |  28  |  #{"29".colorize(:red)}  |  30  |  #{"31".colorize(:blue)}  |  #{"32".colorize(:green)}  | GOAL"
    end

    # test ID 4
    def display_sugoroku_board
        @sugoroku_array = [@vertical_border, @one_to_ten, @vertical_border, @eleven, @vertical_border, @twelve_to_twentyone, @vertical_border, @twentytwo, @vertical_border, @twentythree_to_goal, @vertical_border]
        @sugoroku_array.each do |line|
            puts line
        end
    end

    #test ID The 15
    def display_position_on_board(number)

        case number
        when 0
            @one_to_ten["START"] = "START".colorize(:magenta)
            display_sugoroku_board
        when 1..10
            @one_to_ten[number.to_s] = "●"
            display_sugoroku_board
        when 11
            @eleven[number.to_s] = "●"
            display_sugoroku_board
        when 12..21
            @twelve_to_twentyone[number.to_s] = "●"
            display_sugoroku_board
        when 22
            @twentytwo[number.to_s] = "●"
            display_sugoroku_board
        when 23..32
            @twentythree_to_goal[number.to_s] = "●"
            display_sugoroku_board
        else
            @twentythree_to_goal["GOAL"] = "GOAL".colorize(:magenta)
            display_sugoroku_board
        end
    end

end

# test = SugorokuBoard.new
# test.display_position_on_board
