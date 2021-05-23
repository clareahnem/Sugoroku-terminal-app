require_relative "methods"
require_relative "play_sugoroku"
require "tty-prompt"
require "tty-spinner"
require "colorize"
require "tty-table"


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
        
        play_game
        #after game is done, as if they want to play again or go back to menu
        play_again_or_not
    when 3
        # when user selects "View Ranking Board"
        hold_and_clear_terminal(0.3)
        display_rankboard
        back_to_menu_or_exit
    when 4
        # when user selects "Exit Program"
        exit_program
    else
        "Invalid Input. Please Try Again"
    end 
        

end

