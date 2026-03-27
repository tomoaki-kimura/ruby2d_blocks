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
      if self.x < 0
        self.x = 0
      end
    end
    if key == "right"
      self.x += self.speed
      if self.x > Window.width - self.width
        self.x = Window.width - self.width
      end
    end
  end
end