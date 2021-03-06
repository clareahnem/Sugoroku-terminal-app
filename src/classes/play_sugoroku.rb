
class Play
    attr_accessor :name
    attr_reader :position, :score

    def initialize(name)
        @name = name
        @position = 0
        @score = 0
    end

    # ===============================================
    #      method to move player's position
    # ===============================================
    # test ID 7
    def move(number)
        @position += number
        if @position < 32
            puts "You moved #{number} steps forward"
        end
        sleep(1)
        landed_on_which_panel(@position)
    end


    # ========================================================================================
    #       outputs different message according to color of panel and adds appropriate score
    # ========================================================================================

    def landed_on_which_panel(position)
        case @position
        when  3, 6, 11, 18, 21, 26, 27, 32 
            # =======================
            #       green panels
            # =======================
            flash_text("Hooray! You have landed on a green panel! You gained 300pts!".colorize(:green))
            @score += 300
        when  4, 14, 17, 20, 23, 29 
            # =======================
            #       red panels
            # =======================
            flash_text("Oh no! You have landed on a red panel! You lost 100pts".colorize(:red))
            @score -= 100
        when  9, 16, 31
            # ==========================================
            #       blue panels. Activates Bonus round
            # ==========================================
            if @score < 0 # bad message if player's score is currently negative
                flash_text("OH NO!! You've landed on a blue panel with a negative score! Your score will multiply by number rolled on dice!".colorize(:blue))
                bonus_panel
            elsif @score == 0 # no emotion message if player's score is currently zero
                "You've landed on the blue multiply panel. Since your score is 0, looks like nothing will happen.".colorize(:blue)
            else # excited message if player's score is currently positive
                flash_text("WOWW!! You've landed on a blue panel! Roll the dice to multiply your score!".colorize(:blue))
                bonus_panel
            end
        else
            # =============================
            #     standard panels or Goal
            # =============================
            if position < 32
                flash_text("You've landed on a standard panel. You gained 100pts!")
                @score += 100
            else
                flash_text("Congratulations! You've reached the Goal!".colorize(:magenta))
                save_data(@name, @score)
            end
        end
    end

    # ===================================================
    #       bonus round if player lands on blue panel
    # ===================================================
    def bonus_panel
        dice = roll_dice
        if dice == 1
            puts dice
            puts "No change made to your score"
        else
            puts dice
            puts "Your score multiplies by #{dice}!".colorize(:blue)
        end
        @score *= dice
    end

    # =================================================================
    #       rendering table with name, position and score
    # =================================================================
    def display_score
        current_score_table = TTY::Table.new(["Name", "Total Steps Taken","Current Score"], [[@name, "#{@position}/33", @score]]) 
        puts current_score_table.render(:unicode, resize: true, width: 50)
    end


    # ================================================================
    #       saving user's final score to ranking.txt
    # ================================================================
    #test ID 13
    def save_data(name, score)
        prompt = TTY::Prompt.new
        save_output = prompt.select("Would you like to submit your score to ranking board?", ["Yes", "No"])
        if save_output == "Yes"
            # test ID 16
            begin
            File.write('./files/ranking.txt', "#{name}, #{score}\n", File.size('./files/ranking.txt'), mode: 'a')
            rescue
                loading_spinner(2, "Error loading file. Your score could not be added.")
            else
                loading_spinner(2, "Your score has been successfully submitted.")
            end
        elsif save_output == "no"
            puts "alright. navigating you back to menu..."
            hold_and_clear_terminal(0.7)
        end
    end
end