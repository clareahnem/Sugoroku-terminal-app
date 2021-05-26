
# ==============================================
#       methods for main menu and nagivation
# ==============================================
def menu_select
    prompt = TTY::Prompt.new
    choices = {"How to Play" => 1, "Play Sugoroku" => 2, "View Ranking Board" => 3, "Exit Program" => 4}
    menu_output = prompt.select("What would you like to do?", choices, convert: :integer)

    menu_output
end

#test ID 2
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
    hold_and_clear_terminal(0)
    byebye
    exit
    end
end

# ==============================================
#       methods for HOW TO PLAY feature
# ==============================================

#test ID 1
def open_instructions
    begin
    File.foreach("files/instructions.txt") { |line| puts line }
    rescue
        puts "could not find the file".coloirize(:red)
    end
end

# ==============================================
#       methods for PLAY SUGOROKU feature
# ==============================================

def get_name
    begin
        puts "Choose your name:"
        username = gets.chomp
        raise ArgumentError if username.empty? 
    rescue
        puts "Name cannot be empty. Please try again"
        retry
    end
    return username
end

#test ID 17
def play_til_goal(player)
    until player.position > 32
        player.display_score
        dice = roll_dice
        puts dice
        player.move(dice)
        hold_and_clear_terminal(1.8)
        board = SugorokuBoard.new
        board.display_position_on_board(player.position)
    end
end

def roll_dice
    prompt = TTY::Prompt.new
    prompt.keypress("Press enter to roll the dice and enter again to stop", keys: [:return])
    # start spinner when enter keyt is pressed
    # test ID 6
    spinner = TTY::Spinner.new(frames: ["1", "2", "3", "4", "5", "6"], clear: true)
    spinner.auto_spin
    # stop spinner by pressing enter
    prompt = TTY::Prompt.new
    prompt.keypress(keys: [:return])
    spinner.stop
    rand(1..6)    
end

def play_again_or_not
    prompt = TTY::Prompt.new
    output = prompt.select("Do you want to play again?", ["Yes", "No, go back to Menu"])
    case output
    when "Yes"
        print "loading new game..."
        loading_spinner(1, "")
        hold_and_clear_terminal(0)
        return true
    else
        puts "navigating you back to menu..."
        hold_and_clear_terminal(1)
        return false
    end
end

# ==============================================
#       methods for RANKING BOARD feature
# ==============================================

def display_rankboard
    #convert file data to hash, sort by score and then return in nested array format
    begin
    hash = Hash[File.read('files/ranking.txt').split("\n").map{|i|i.split(', ')}]
    rescue
        puts "failed to load file"
    else 
        ranking = hash.map { |k,v| [k, v.to_i]}.sort_by {|key, value| value}.reverse
        # get rid of ranks 101 and over since we only need top 100
        top_hundred = ranking.slice(0, 100)
        # then convert this data into tty table
        rankboard_table(top_hundred)
    end
end

def rankboard_table(ranks)
    # push rank number to each child array
    i = 1
    ranks.each do |one_data|
        one_data.unshift i
        i += 1
    end
    table = TTY::Table.new(["Rank","Name","Score"], ranks)
    puts table.render(:unicode)
end

# ==============================================
#       methods for visual effects
# ==============================================

def loading_spinner(time, message)
    spinner = TTY::Spinner.new(":spinner", format: :bouncing_ball)
    spinner.auto_spin 
    sleep(time) 
    spinner.stop(message) 
end

def hold_and_clear_terminal(time)
    sleep(time)
    system 'clear'
end

#test ID 14
def flash_text(text)
    4.times do
        print "\r#{ ' ' * text.size }"
        sleep 0.3
        print  "\r#{ text }"
        sleep 0.3
    end
    print "\n"
end
