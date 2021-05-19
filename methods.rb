
def menu_select
    prompt = TTY::Prompt.new
    choices = {"How to Play" => 1, "Play Sugoroku" => 2, "View Randking Board" => 3, "Exit Program" => 4}
    menu_output = prompt.select("What would you like to do?", choices, convert: :integer)

    menu_output
end

def exit_program
    prompt = TTY::Prompt.new
    quit_choice = prompt.yes?("Are you sure yo want to exit?", convert: :boolean)
    if quit_choice
    puts "See you again!"
    exit
    end
end