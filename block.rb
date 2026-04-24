class Block < Rectangle
  BLOCK_COLORS = %w(
    red
    orange
    yellow
    green
    blue
    fuchsia
    purple
  )

  def initialize
    super(
      width: 80,
      height: 25,
    )
    self.x = self.width / 2
    self.y = self.height * 2
  end

  def self.set_blocks
    BLOCK_COLORS.map.with_index(0) do |color, r|
      9.times.map do |c|
        block = self.new
        block.color = color
        block.x += block.width * c
        block.y += block.height * r
        block.width -= 1
        block.height -= 1
        block
      end
    end.flatten
  end

  def self.broken_by(ball, blocks)
    blocks.each do |block|
      block.refrect(ball, blocks)
    end
  end

  def refrect(ball, blocks)
    top_refrect(ball, blocks)
    bottom_refrect(ball, blocks)
    right_refrect(ball, blocks)
    left_refrect(ball, blocks)
  end

  private

  def top_refrect(ball, blocks)
    contain = ball.contains?(ball.x, self.y - ball.radius)
    range = ball.x >= self.x && ball.x <= self.x + self.width
    if contain && range
      ball.y_flug = false
      self.remove
      blocks.delete(self)
    end
  end

  def bottom_refrect(ball, blocks)
  end

  def right_refrect(ball, blocks)
  end

  def left_refrect(ball, blocks)
  end
end