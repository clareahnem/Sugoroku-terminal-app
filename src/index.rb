require_relative "./methods/methods"
require_relative "./classes/play_sugoroku"
require_relative "./methods/ascii"
require_relative "command_line_args"
require_relative "./classes/board"
require "tty-prompt"
require "tty-spinner"
require "colorize"
require "tty-table"


while true
loading_spinner(1.5, "")
hold_and_clear_terminal(0)
puts "Welcome to Command Line".colorize(:red)
title_art

case menu_select
    # ===============================
    #       case 1: HOW TO PLAY
    # ===============================
    when 1 
        hold_and_clear_terminal(0.3)
        # print title to screen
        how_to_title
        # and open instruction file
        open_instructions
        puts "\n"
        # then display options for next step
        back_to_menu_or_exit
        hold_and_clear_terminal(0.3)

    # ===============================
    #       case 2: PLAY GAME
    # ===============================
    when 2
        hold_and_clear_terminal(0.5)
        start_title
        # get name from user.
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
    
    # ===============================
    #       case 3: VIEW RANKING
    # ===============================
    when 3
        loading_spinner(1.5, "")
        hold_and_clear_terminal(0)
        # display ranking title
        ranking_title
        # and display ranking board
        display_rankboard
        # then display option for next step
        back_to_menu_or_exit
        hold_and_clear_terminal(0.3)

    # ===============================
    #       case 4: EXIT PROGRAM
    # ===============================
    when 4
        exit_program
    else
        "Invalid Input. Please Try Again"
    end 
end

