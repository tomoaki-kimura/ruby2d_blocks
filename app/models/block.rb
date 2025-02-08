class Block < Rectangle
  attr_accessor :is_active, :is_breakable

  def initialize
    super
    self.is_active = true
    self.is_breakable = true
    self.x = 50
    self.y = 45
    self.width = 50
    self.height = 15
  end

  def self.start
    num = rand(1..1)
    data = CSV.read("app/maps/stage_1.csv")
    maps = data.map { |row| row.map(&:to_i) }
    self.blocks(maps)
  end

  def hit(ball)
    if ball.contains?(ball.x, self.y + self.height) && ball.x > self.x && ball.x < self.x + self.width
      self.reject_block_and_refrect(ball)
    end
  end

  private

  def self.blocks(maps)
    blocks = maps.map.with_index(0) do |row, i|
      row.map.with_index(0) do |col, n|
        block = self.new
        block.x = block.x + block.width * n
        block.width -= 1
        block.color = self.colors[i]
        block.y = block.y + block.height * i
        block.height -= 1
        if col == 0
          block.is_active = false
          block.remove
        elsif col == 2
          block.is_breakable = false
          block.color = "silver"
        end
        block
      end
    end
    blocks.flatten
  end

  def self.colors
    ["red", "orange", "yellow", "green", "olive", "blue", "purple"]
  end

  def block_break_if_breakable 
    if self.is_breakable
      self.is_active = false
      self.remove
    end
  end

  def reject_block_and_refrect(ball)
    ball.y_flug = true
    self.block_break_if_breakable
  end
  #TODO:ball.y_flug の動きを４パターンに分ける必要あり。

  def top_hit(ball)
  end

  def bottom_hit(ball)
  end

  def left_hit(ball)
  end

  def right_hit(ball)
  end
end