require './player'

class QuizGame

  def self.main
    game = QuizGame.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def start
    greet_players
    until game_over? do
      puts "Are you ready #{current_player.name}?"
      gets
      # TODO ask a question and only award point if correct
      print_scores
    end
  end

  def game_over?
    @players.any? { |player| player.lives >= 0 }
  end

  def lose_life
    current_player.lose_life
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts 'Would you like to change your name? (y/N) '
      if gets.chomp == 'y'
        puts 'Enter your new name: '
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
      end
    end
  end

  def print_scores
    @players.each do |player|
      puts "#{player.name} has #{player.points} points"
    end
  end

end

QuizGame.main