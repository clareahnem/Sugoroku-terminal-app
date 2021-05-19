require "whirly"
Whirly.start spinner: "bouncingBall", append_newline: false, remove_after_stop: true, non_tty: true do 
    sleep 3
end
puts rand(1..6)     
