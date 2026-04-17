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
      9.times do |c|
        block = self.new
        block.color = color
        block.x += block.width * c
        block.y += block.height * r
        block.width -= 1
        block.height -= 1
      end
    end
  end
end