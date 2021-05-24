if ARGV.length > 0
    flag, *rest = ARGV
    ARGV.clear
    case flag
    when '-help'
        system 'clear'
        puts "This is a Terminal Sugoroku Game Application."
        puts "To load Program, simply run the Terminal_Sugoroku.sh file. It will lead you to the main page with options to read instructions, see top scores and playing Sugoroku Game."
        puts "\nFor more information about this app, see 'ruby index.rb -info' or go to https://github.com/clareahnem/Sugoroku-terminal-app and read instructions listed on README.md "
        exit
    when '-info'
        puts "This application is running on  Ruby Version: #{RUBY_VERSION}"
        puts "Before starting the Game, you will need to download the Ruby Gem Bundler for this application, which is listed on this app's GITHUB page"
        puts "Please go to https://github.com/clareahnem/Sugoroku-terminal-app and read through README.md on more detailed instructions on how to install ruby gems required for this Application"
    else
        puts "invalid argument.".colorize(:red)
        puts "for help, please type in'ruby index.rb -help"
        puts "for information, please type in'ruby index.rb -info"
        puts "for further instructions, please refer to README.md on https://github.com/clareahnem/Sugoroku-terminal-app. This will contain detailed instructions on how to run this application."
        exit
    end
end