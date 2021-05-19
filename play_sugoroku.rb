require_relative "board"

class Play
    attr_accessor :name
    attr_reader :position, :score 
    def initialize(name)
        @name = name
        @position = 0
        @score = 0
        @board = SugorokuBoard.new
    end
    
    def move
        to_move = rand(1..6)
        @position += to_move
        case @position
        when 3 || 6 || 11 || 18 || 21 || 26 || 27 || 32
            @score += 300
        when 4 || 14 || 20 || 23 || 29
            @score -= 100
        when 9 || 16 || 31
            bonus_panel
        else
            @score += 100
        end

    end

    def display_score
        @board.display_position_on_board(@position)
        puts "Current score: #{@score}pts"
    end
end

clare = Play.new("clare")
clare.display_score