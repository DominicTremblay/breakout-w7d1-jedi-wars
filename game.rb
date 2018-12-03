require_relative './jedi'
require_relative './turn'

class Game

  def initialize
    @jedi1 = Jedi.new("Luke")
    @jedi2 = Jedi.new("Vador")
    @jedi3 = Jedi.new("Mace Windu")
    @jedi4 = Jedi.new("Leia")
    @jedis=[@jedi1, @jedi2, @jedi3, @jedi4]
    @turn = Turn.new(@jedis)
  end

  def run

    while(!game_over?)

      @turn.new_turn
      current_jedi = @turn.current_player
      ennemy_jedi = @turn.ennemy_player
      current_jedi.attacks(ennemy_jedi)
      puts ""
      summary
      sleep 0.7
    end

    end_game

  end


  def summary 
    puts "----- Summary ------"
    puts @jedis.map{|jedi| jedi.status}.join("\n")
    puts ""
  end

  def game_over?
    @jedis.any?{|jedi| jedi.dead?}
  end

  def end_game
    puts "====== Game Over! ======="
    loser = @jedis.select{|jedi| jedi.dead?}.first
    puts "#{loser.name} has become a force ghost!"
  end

end