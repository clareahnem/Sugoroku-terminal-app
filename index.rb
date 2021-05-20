require_relative "methods"
require_relative "play_sugoroku"
require "tty-prompt"
require "tty-spinner"
require "colorize"


while true
puts "Welcome to Command Line Sugoroku"
# menu_select

case menu_select
    when 1 
        # when user selects "How to play"
        hold_and_clear_terminal(0.5)
        open_instructions
        puts "\n"
        back_to_menu_or_exit
        hold_and_clear_terminal(0.5)
    when 2
        # when user selects "Play Sugoroku"
        hold_and_clear_terminal(0.5)
        puts "Let's start playing!"
        # get name from user. raise error if name is empty
        begin
            puts "Choose your name:"
            username = gets.chomp.downcase
            raise ArgumentError if username.empty? 
        rescue
            puts "Name cannot be empty. Please try again"
            retry
        end
        username = Play.new(username)
        # clear terminal and display sugoroku board
        system 'clear'
        board = SugorokuBoard.new
        board.display_position_on_board(username.position)
        # instruct user to roll the dice
        
        until username.position > 32
            # keep rolling dice and move across the board until you hit the goal
            puts "your position is #{username.position} and your score is now #{username.score}pts"
            dice = roll_dice
            puts dice
            username.move(dice)
            hold_and_clear_terminal(3)
            board = SugorokuBoard.new
            board.display_position_on_board(username.position)
        end
        back_to_menu_or_exit
    when 3
        # when user selects "View Ranking Board"
        puts "Loading ranking board"
        exit
    when 4
        # when user selects "Exit Program"
        exit_program
    else
        "Invalid Input. Please Try Again"
    end 
        

end

