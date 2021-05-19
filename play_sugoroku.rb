class Play
    attr_accessor :name
    attr_reader :position, :score 
    def initialize(name)
        @name = name
        @position = 0
        @score = 0
    end
end