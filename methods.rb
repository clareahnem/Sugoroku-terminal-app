

def menu_select
    prompt = TTY::Prompt.new
    choices = {"How to Play" => 1, "Play Sugoroku" => 2, "View Randking Board" => 3, "Exit Program" => 4}
    menu_output = prompt.select("What would you like to do?", choices, convert: :integer)

    menu_output
end

def open_instructions
    File.foreach("./instructions.txt") { |line| puts line }
end

def back_to_menu_or_exit
    prompt = TTY::Prompt.new
    instruction_output = prompt.select("Do you want to go back to Menu?", ["Yes", "No, Exit Program"])
    if instruction_output == "No, Exit Program"
        exit_program
    end
end

def exit_program
    prompt = TTY::Prompt.new
    quit_choice = prompt.yes?("Are you sure you want to exit?", convert: :boolean)
    if quit_choice
    puts "See you again!"
    exit
    end
end

def hold_and_clear_terminal(time)
    sleep(time)
    system 'clear'
end

def roll_dice
    prompt = TTY::Prompt.new
    prompt.keypress("Press enter to roll the dice", keys: [:return])
    # start spinner when enter keyt is pressed
    spinner = TTY::Spinner.new(frames: ["1", "2", "3", "4", "5", "6"], clear: true)
    spinner.auto_spin
    # stop spinner by pressing enter
    prompt = TTY::Prompt.new
    prompt.keypress("Press enter to stop dice", keys: [:return])
    spinner.stop
    rand(1..6)    
end
