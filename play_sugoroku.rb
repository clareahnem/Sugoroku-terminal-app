require_relative "board"

class Play
    attr_accessor :name
    attr_reader :position, :score 
    def initialize(name)
        @name = name
        @position = 0
        @score = 0
        # @board = SugorokuBoard.new
    end

    
    def move(number)
        @position += number
        if @position < 32
            puts "You moved to panel #{@position}"
        end
        sleep(1)
        landed_on_which_panel(@position)
        # case @position
        # when  3, 6, 11, 18, 21, 26, 27, 32
        #     puts "Hooray! You have landed on a green panel! You gained 300pts!".colorize(:green)
        #     @score += 300
        # when  4, 14, 17, 20, 23, 29
        #     puts "Oh no! You have landed on a red panel! You lost 100pts".colorize(:red)
        #     @score -= 100
        # when  9, 16, 31
        #     puts "You've landed on a blue panel! Roll the dice to multiply your score!".colorize(:blue)
        #     bonus_panel
        # else
        #     if position < 32
        #         puts "You've landed on a standard panel. You gained 100pts!"
        #         @score += 100
        #     else
        #         puts "Congratulations! You've reached the Goal!".colorize(:magenta)
        #     end
        # end
    end

    def landed_on_which_panel(position)
        case @position
        when  3, 6, 11, 18, 21, 26, 27, 32
            puts "Hooray! You have landed on a green panel! You gained 300pts!".colorize(:green)
            @score += 300
        when  4, 14, 17, 20, 23, 29
            puts "Oh no! You have landed on a red panel! You lost 100pts".colorize(:red)
            @score -= 100
        when  9, 16, 31
            puts "You've landed on a blue panel! Roll the dice to multiply your score!".colorize(:blue)
            bonus_panel
        else
            if position < 32
                puts "You've landed on a standard panel. You gained 100pts!"
                @score += 100
            else
                puts "Congratulations! You've reached the Goal!".colorize(:magenta)
            end
        end
    end

    def bonus_panel
        dice = roll_dice
        puts "Your score multiplies by #{dice}!".colorize(:blue)
        @score *= dice
    end

    def display_score
        @board.display_position_on_board(@position)
    end
end

# clare = Play.new("clare")
# clare.display_score