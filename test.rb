require "tty-spinner"
spinner = TTY::Spinner.new(frames: ["1", "2", "3", "4", "5", "6"], clear: true)
spinner.auto_spin
sleep 1.5
spinner.stop
puts rand(1..6)

