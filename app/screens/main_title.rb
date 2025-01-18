class MainTitle
  attr_accessor :title, :message
  def initialize
    self.title = Text.new("BLOCKS",
                      size: 100,
                      x: 200,
                      y: 100)
    self.message = Text.new("press key 'space' to start",
                        size: 30,
                        x: 210,
                        y: 300)
  end

  def color_change
    self.title.color = "random"
  end
end