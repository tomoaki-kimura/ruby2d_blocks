class Bar < Rectangle
  attr_accessor :speed

  def initialize
    super
    self.speed = 5
    self.width = 100
    self.height = 15
    self.x = (Window.width - self.width) / 2
    self.y = Window.height - self.height * 3
  end

  def move(event)
    key = event.key
    if key == "left"
      self.x -= self.speed
    end
    if key == "right"
      self.x += self.speed
    end
  end
end