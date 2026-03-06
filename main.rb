require "ruby2d"

class Ball < Circle
  attr_accessor :speed

  def initialize
    super
    self.speed = 5
    self.radius = 10
  end
end

ball = Ball.new

update do 
  ball.x += ball.speed
end

show