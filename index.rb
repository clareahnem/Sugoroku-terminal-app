require_relative "methods"
require_relative "play_sugoroku"
require "tty-prompt"


while true
puts "Welcome to Command Line Sugoroku"
# menu_select

case menu_select
    when 1 
        # when user selects "How to play"
        hold_and_clear_terminal
        open_instructions
        puts "\n"
        back_to_menu_or_exit
        hold_and_clear_terminal
    when 2
        # when user selects "Play Sugoroku"
        hold_and_clear_terminal
        puts "Choose your name:"
        username = gets.chomp.downcase
        username = Play.new(username)
        username.display_score
        # until username.position > 32
        #     # keep rolling dice and move across the board until you hit the goal
        # end
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

