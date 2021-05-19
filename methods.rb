

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

def hold_and_clear_terminal
    sleep(0.5)
    system 'clear'
end

def roll_dice
    Whirly.start spinner: "bouncingBall", append_newline: false, remove_after_stop: true, non_tty: true do 
        sleep 1.5
    end
    puts rand(1..6)    
end
