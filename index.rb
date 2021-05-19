require_relative "methods"
require_relative "play_sugoroku"
require "tty-prompt"


while true
puts "Welcome to Command Line Sugoroku"
# menu_select

case menu_select
    when 1 
        hold_and_clear_terminal
        open_instructions
        puts "\n"
        back_to_menu_or_exit
        hold_and_clear_terminal
    when 2
        hold_and_clear_terminal
        puts "Choose your name:"
        username = gets.chomp
        username = Play.new(username)
        puts username.name
        back_to_menu_or_exit
    when 3
        puts "Loading ranking board"
        exit
    when 4
        exit_program
    else
        "Invalid Input. Please Try Again"
    end 
        

end

