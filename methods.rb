
def menu_select
    prompt = TTY::Prompt.new
    choices = {"How to Play" => 1, "Play Sugoroku" => 2, "View Randking Board" => 3, "Exit Program" => 4}
    menu_output = prompt.select("What would you like to do?", choices, convert: :integer)

    menu_output
end