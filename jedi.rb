class Jedi

  attr_reader :name
  attr_accessor :hp

  def initialize(name)
    @name = name
    @hp = 30
    @ap = 10
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def attacks(ennemy_jedi)
    puts "#{name} is attacking #{ennemy_jedi.name}"
    damage = rand(@ap) + 1
    ennemy_jedi.take_damage(damage)
  end

  def take_damage(amount)
    puts "#{name} is taking #{amount} damage points!"
    @hp -= amount
  end

  def status
    "#{name} HP: #{@hp}"
  end

  def dead?
    @hp <= 0
  end

end