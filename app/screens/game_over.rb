
require "ruby2d"

class GameOver
  ATTRIBUTES = %i(
    title
    continue_message
    restart_message
  )

  attr_accessor *GameOver::ATTRIBUTES

  def initialize
    self.title = Text.new(
      "GAME OVER",
      size: 100,
      x: 100, y: 100
    )
    self.continue_message = Text.new(
      "Press Key 'C' to Continue",
      size: 30,
      x: 200, y: 280
    )
    self.restart_message = Text.new(
      "Press Key 'R' to Restart",
      size: 30,
      x: 200, y: 350
    )
    self.remove
  end

  def add
    attr_to_s.each { |attr| eval("self.#{attr}.add") }
  end

  def remove
    attr_to_s.each { |attr| eval("self.#{attr}.remove") }
  end

  private

  def attr_to_s
    GameOver::ATTRIBUTES.map { |sym| sym.to_s }
  end
end
