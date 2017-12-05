class Player
    
      attr_reader :lives
    
      def initialize(name)
        @name = name
        @lives = 3
      end
    
      def lose_life
        @lives -= 1
      end
    
    end