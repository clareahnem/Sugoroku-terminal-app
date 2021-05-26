require "colorize"


class SugorokuBoard

    def initialize 
        @vertical_border = "\n     +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+"
        @one_to_ten = ["START|", "  ■  |", "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:green), "  ■  |", "  ■  |", "  ■  |".colorize(:blue), "  ■  |"]
        @eleven = ["                                                           |", "  ■  |".colorize(:green)]
        @twelve_to_twentyone = ["     |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:red), "  ■  |".colorize(:blue), "  ■  |", "  ■  |".colorize(:red), "  ■  |", "  ■  |"]
        @twentytwo = ["     |", "  ■  |"]
        @twentythree_to_goal = ["     |", "  ■  |".colorize(:red), "  ■  |", "  ■  |", "  ■  |".colorize(:green), "  ■  |".colorize(:green), "  ■  |", "  ■  |".colorize(:red), "  ■  |", "  ■  |".colorize(:blue), "  ■  |".colorize(:green), "GOAL"]
    end

    # test ID 4
    def display_sugoroku_board
        puts @vertical_border
        @one_to_ten.each {|item| print item}
        puts @vertical_border
        @eleven.each {|item| print item}
        puts @vertical_border
        @twelve_to_twentyone.each {|item| print item}
        puts @vertical_border
        @twentytwo.each {|item| print item}
        puts @vertical_border
        @twentythree_to_goal.each {|item| print item}
        puts @vertical_border
    end

    #test ID The 15
    def display_position_on_board(number)

        case number
        when 0
            @one_to_ten[0] = "   💃|"
            display_sugoroku_board
        when 1..10
            @one_to_ten[number] = "  💃  |"
            display_sugoroku_board
        when 11
            @eleven[1] = "  💃  |"
            display_sugoroku_board
        when 12..21
            index = (number - 11) * -1
            @twelve_to_twentyone[index] = "  💃  |"
            display_sugoroku_board
        when 22
            @twentytwo[1] = "  💃  |"
            display_sugoroku_board
        when 23..32
            index = number - 22
            @twentythree_to_goal[index] = "  💃  |"
            display_sugoroku_board
        else
            @twentythree_to_goal[11] = "💃"
            display_sugoroku_board
        end
    end

end

# test = SugorokuBoard.new
# test.display_position_on_board
