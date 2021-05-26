# test ID 19
if ARGV.length > 0
    flag, *rest = ARGV
    ARGV.clear
    case flag
    when '--help', '-h'
        puts "This is a Terminal Sugoroku Game Application."
        puts "To load Program, simply run the Terminal_Sugoroku.sh file by typing in './Terminal_Sugoroku.sh' on your terminal."
        puts "All of the files containing scripts and code for the app is inside the src/ directory. In order to run the program with no error, you must cd into the src file."
        puts "Please make sure that you are in the correct directory(folder) before you run the script file."
        puts "Once you activate the application, you will be lead to the main page with options to read instructions, see top scores and playing Sugoroku Game."
        puts "For more information about this app, see 'ruby index.rb -info'/'ruby index.rb --i' or go to https://github.com/clareahnem/Sugoroku-terminal-app and read instructions listed on README.md "
        exit
    when '--info', '-i'
        puts "This application is running on  Ruby Version: #{RUBY_VERSION}"
        puts "Before starting the Game, you will need to have ruby running on your computer and download the Ruby Gem Bundler for this application by typing 'bundle install' on your terminal"
        puts "If you have not used bundler before, you may need to install bundler gem. Plase do so by running 'install bundler' on your command line"
        puts "If you have not used RubyGems before, you may also need to download RubyGem on your computer"
        puts "MacOS users will have RubyGem downloaded automatically, but for other computer systems you may need a download. RubyGem is required in order to install bundler, hence is crucial that you have this on your system."
        puts "Application was created using ruby version 2.7.1. Please be advised that if your ruby version is much older the program may not run accordingly."
        puts "Please go to https://github.com/clareahnem/Sugoroku-terminal-app and read through README.md on for more details about downloading ruby gems and bundler"
        exit
    else
        puts "Invalid argument."
        puts "For help, please type in'ruby index.rb --help' or 'ruby index.rb -h'"
        puts "For information, please type in'ruby index.rb --info' or 'ruby index.rb -i'"
        puts "For further instructions, please refer to README.md on https://github.com/clareahnem/Sugoroku-terminal-app. This will contain detailed instructions on how to run this application."
        exit
    end
end