class Ball < Circle
  attr_accessor :speed, :is_move, :x_flug, :y_flug

  def initialize
    super
    self.speed = 5
    self.radius = 10
    self.is_move = false
    self.x_flug = true
    self.y_flug = false 
  end

  def follow(bar)
    self.x = bar.x + bar.width - self.radius * 2
    self.y = bar.y - self.radius
  end

  def move
    if x_flug
      self.x += self.speed
    else
      self.x -= self.speed
    end
    if y_flug
      self.y += self.speed
    else
      self.y -= self.speed
    end
  end
end