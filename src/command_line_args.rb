# test ID 19
if ARGV.length > 0
    flag, *rest = ARGV
    ARGV.clear
    case flag
    when '-help', '--h'
        puts "This is a Terminal Sugoroku Game Application."
        puts "To load Program, simply run the Terminal_Sugoroku.sh file by typing in './Terminal_Sugoroku.sh' on your terminal."
        puts "PleaseMake sure that you are in the correct directory(folder) when typing the above command"
        puts "This will lead you to the main page with options to read instructions, see top scores and playing Sugoroku Game."
        puts "For more information about this app, see 'ruby index.rb -info'/'ruby index.rb --i' or go to https://github.com/clareahnem/Sugoroku-terminal-app and read instructions listed on README.md "
        exit
    when '-info', '--i'
        puts "This application is running on  Ruby Version: #{RUBY_VERSION}"
        puts "Before starting the Game, you will need to have ruby running on your computer and download the Ruby Gem Bundler for this application by typing 'bundle install' on your terminal"
        puts "Please go to https://github.com/clareahnem/Sugoroku-terminal-app and read through README.md on for more details about ruby gems and bundler"
        exit
    else
        puts "invalid argument."
        puts "For help, please type in'ruby index.rb -help' or 'ruby index.rb --h'"
        puts "For information, please type in'ruby index.rb -info' or 'ruby index.rb --i'"
        puts "For further instructions, please refer to README.md on https://github.com/clareahnem/Sugoroku-terminal-app. This will contain detailed instructions on how to run this application."
        exit
    end
end