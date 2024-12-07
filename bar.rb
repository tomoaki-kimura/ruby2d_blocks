class Bar < Rectangle
  attr_accessor :speed
  def initialize
    super
    width = 150
    height = 15
    self.speed = 5
    self.width = width
    self.height = height
    self.x = (Window.width - width) / 2
    self.y = Window.height - height * 3
  end

  def move(event)
    if event.key == "a"
      self.x -= self.speed
    end
    if event.key == "d"
      self.x += self.speed
    end
    limit
  end

  private

  def limit
    if self.x < 0
      self.x = 0
    end
    if self.x > Window.width - self.width
      self.x = Window.width - self.width
    end
  end
end
