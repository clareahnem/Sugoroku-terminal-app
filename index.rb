require_relative "methods"
require "tty-prompt"


while true
puts "Welcome to Command Line Sugoroku"
# menu_select

case menu_select
    when 1 
        puts "Instruction"
        exit
    when 2
        puts "Let's Play"
        exit
    when 3
        puts "Loading ranking board"
        exit
    when 4
        prompt = TTY::Prompt.new
        quit_choice = prompt.yes?("Are you sure yo want to exit?", convert: :boolean)
        if quit_choice
        puts "See you again!"
        exit
        end
    else
        "Invalid Input. Please Try Again"
    end 
        

end

