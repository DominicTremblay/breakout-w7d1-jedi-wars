class Turn

  attr_reader :current_player, :ennemy_player

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @ennemy_player = nil
    @round = 1
  end

  def get_current_player
    @players.first
  end

  def new_turn
    puts "------ Round##{@round} ------"
    puts ""
    @current_player = get_current_player
    @ennemy_player = get_ennemy_player(@current_player)
    @players.rotate!
  end

  def get_ennemy_player(current)
    @players.select{|jedi| jedi != current}.sample
  end

end