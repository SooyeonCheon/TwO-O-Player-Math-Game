class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def play
    while @player1.alive? && @player2.alive?
      question = Question.new
      puts @current_player.name + ": " + question.to_s
      answer = gets.chomp.to_i
      if question.correct?(answer)
        puts @current_player.name + ": YES! You are correct."
      else
        @current_player.lose_life
        puts @current_player.name + ": Seriously? No!"
      end

      puts "P1: " + @player1.lives.to_s + "/3 vs " + "P2: " + @player2.lives.to_s + "/3"
      puts "----- NEW TURN -----"
      switch_players
    end

    puts @current_player.name + " wins with a score of " + @current_player.lives.to_s + "/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  private

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end