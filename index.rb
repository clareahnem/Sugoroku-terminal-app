require_relative "methods"
require_relative "play_sugoroku"
require_relative "ascii"
require "tty-prompt"
require "tty-spinner"
require "colorize"
require "tty-table"


while true
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

        sugoroku_loop_running = true
        while sugoroku_loop_running
            # test ID 3
            user = Play.new(username)
            system 'clear'
            board = SugorokuBoard.new
            board.display_position_on_board(user.position)

            # keep rolling dice and move across the board until you hit the goal
            until user.position > 32
                user.display_score
                dice = roll_dice
                puts dice
                user.move(dice)
                hold_and_clear_terminal(1.8)
                board = SugorokuBoard.new
                board.display_position_on_board(user.position)
            end
            #after game is done, as if they want to play again or go back to menu. play_again_or_not returns true or false
            sugoroku_loop_running = play_again_or_not
        end
        hold_and_clear_terminal(0.3)
    when 3
        # when user selects "View Ranking Board"
        # display ranking title
        hold_and_clear_terminal(0.3)
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

