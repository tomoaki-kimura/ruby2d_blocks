class Ball < Circle
  attr_accessor :is_move, :x_flug, :y_flug, :speed

  def initialize
    super
    self.radius = 10
    self.is_move = false
    self.x_flug = true
    self.y_flug = false
    self.speed = 5
  end

  def follow(bar)
    self.x = bar.x + bar.width - radius * 2
    self.y = bar.y - radius
  end

  def move
    if is_move
      move_(:x)
      move_(:y)
    end
  end

  private

  def move_(axis)
    if send("#{axis.to_s}_flug")
      eval("self.#{axis.to_s} += speed")
    else
      eval("self.#{axis.to_s} -= speed")
    end
  end
end