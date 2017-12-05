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

  def ask_question_1
    puts "#{current_player.name}: What is 1 + 1?"
    if gets.chomp == "2"
      puts "Correct! Way to go!"
    else
      puts "WRONG! YOU'RE HORRIBLY WRONG!"
      lose_life
    end
  end

  def ask_question_2
    puts "#{current_player.name}: What is 4 x 4?"
    if gets.chomp == "16"
      puts "WOAH! We got ourselves a genius here!"
    else
      puts "YOU'RE A HORRIBLE HUMAN BEING, WHAT'S WRONG WITH YOU!?"
      lose_life
    end
  end

  def start
    greet_players
    until game_over? do
      ask_question_1
      print_scores
      swap_players
      ask_question_2
      print_scores
      swap_players
    end
    puts "-----GAME OVER!!!-----"
    print_scores
  end

  def game_over?
    @players.any? { |player| player.lives == 0 }
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
      puts "#{player.name} has #{player.lives} lives reamining"
    end
  end

end

QuizGame.main