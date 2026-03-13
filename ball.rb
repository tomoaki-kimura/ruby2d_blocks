class Ball < Circle
  attr_accessor :speed

  def initialize
    super
    self.speed = 5
    self.radius = 10
  end

  def follow(bar)
    self.x = bar.x + bar.width - self.radius * 2
    self.y = bar.y - self.radius
  end
end