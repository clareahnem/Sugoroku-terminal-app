def flash_text(text)
    3.times do
    print "\r#{ text }"
    sleep 0.3
    print "\r#{ ' ' * text.size }" # Send return and however many spaces are needed.
    sleep 0.3
    end
end

def menu_select
    prompt = TTY::Prompt.new
    choices = {"How to Play" => 1, "Play Sugoroku" => 2, "View Ranking Board" => 3, "Exit Program" => 4}
    menu_output = prompt.select("What would you like to do?", choices, convert: :integer)

    menu_output
end

def open_instructions
    File.foreach("files/instructions.txt") { |line| puts line }
end

def back_to_menu_or_exit
    prompt = TTY::Prompt.new
    instruction_output = prompt.select("Do you want to go back to Menu?", ["Yes", "No, Exit Program"])
    if instruction_output == "No, Exit Program"
        exit_program
    end
end

# def play_game
#     # user = Play.new(username)
#         # clear terminal and display sugoroku board
#         system 'clear'
#         board = SugorokuBoard.new
#         board.display_position_on_board(user.position)
#         # instruct user to roll the dice
        
#         until user.position > 32
#             # keep rolling dice and move across the board until you hit the goal
#             puts "your position is #{user.position} and your score is now #{user.score}pts"
#             dice = roll_dice
#             puts dice
#             user.move(dice)
#             hold_and_clear_terminal(3)
#             board = SugorokuBoard.new
#             board.display_position_on_board(user.position)
#         end
# end

def play_again_or_not
    prompt = TTY::Prompt.new
    output = prompt.select("Do you want to play again?", ["Yes", "No, go back to Menu"])
    case output
    when "Yes"
        puts "loading new game..."
        hold_and_clear_terminal(1)
    # when "No, go back to Menu"
    #     menu_select
    else
        puts "navigating you back to menu..."
        hold_and_clear_terminal(1)
        sugoroku_loop_running = false
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

def display_rankboard
    #convert to hash, sort by score and then return in nested array format
    hash = Hash[File.read('files/ranking.txt').split("\n").map{|i|i.split(', ')}]
    ranking = hash.map { |k,v| [k, v.to_i]}.sort_by {|key, value| value}.reverse
    rankboard_table(ranking)
end

def rankboard_table(ranking)
    
    i = 1
    ranking.each do |one_data|
    one_data.unshift i
    i += 1
    end

    table = TTY::Table.new(["Rank","Name","Score"], ranking)
    puts table.render(:ascii)
end

def get_name
    begin
        puts "Choose your name:"
        username = gets.chomp.downcase
        raise ArgumentError if username.empty? 
    rescue
        puts "Name cannot be empty. Please try again"
        retry
    end
    return username
end

