require_relative "methods"
require_relative "play_sugoroku"
require_relative "ascii"
require_relative "command_line_args"
require "tty-prompt"
require "tty-spinner"
require "colorize"
require "tty-table"


while true
loading_spinner(1.5, "")
hold_and_clear_terminal(0)
puts "Welcome to Command Line".colorize(:red)
title_art
# menu_select

case menu_select
    when 1 
        # when user selects "How to play"
        hold_and_clear_terminal(0.3)
        # print title to screen
        how_to_title
        # and open instruction file
        open_instructions
        puts "\n"
        # then display options for next step
        back_to_menu_or_exit
        hold_and_clear_terminal(0.3)
    when 2
        # when user selects "Play Sugoroku"
        hold_and_clear_terminal(0.5)
        start_title
        # get name from user. raise error if name is empty
        username = get_name
        loading_spinner(1.5, "")

        sugoroku_loop_running = true
        while sugoroku_loop_running
            # test ID 3
            # initialise new game and scoreboard
            user = Play.new(username)
            system 'clear'
            board = SugorokuBoard.new
            board.display_position_on_board(user.position)
            # keep rolling dice and move across the board until you hit the goal
            play_til_goal(user)
            #after game is done, as if they want to play again or go back to menu. play_again_or_not returns true or false
            sugoroku_loop_running = play_again_or_not
        end
        hold_and_clear_terminal(0.3)
    when 3
        # when user selects "View Ranking Board"
        loading_spinner(1.5, "")
        hold_and_clear_terminal(0)
        # display ranking title
        ranking_title
        # and display ranking board
        display_rankboard
        # then display option for next step
        back_to_menu_or_exit
        hold_and_clear_terminal(0.3)
    when 4
        # when user selects "Exit Program"
        exit_program
    else
        "Invalid Input. Please Try Again"
    end 
end

