class Block < Rectangle
  BLOCK_COLORS = %w(
    red
  )

  def initialize
    super(width: 150, height: 15)
  end

  def self.set_blocks
    BLOCK_COLORS.each do |color|
      block = self.new
      block.color = color
    end
  end
end