class Ball < Circle
  attr_accessor :is_move, :x_flug, :y_flug, :speed, :score, :score_display, :life, :life_display

  def initialize
    super
    self.radius = 7
    self.is_move = false
    self.x_flug = true
    self.y_flug = false
    self.speed = 5
    self.score = 0
    self.score_reload
    self.life = 3
    self.life_reload
  end

  def follow(bar)
    self.x = bar.x + bar.width - radius * 2
    self.y = bar.y - radius
  end

  def move(state)
    if is_move
      move_(:x)
      move_(:y)
      game_failed_check(state)
    end
  end

  def score_reload
    self.score_display = Text.new("score: #{ sprintf("%07d", self.score) }", x: (Window.width))
    self.score_display.x -= self.score_display.width + 30
    self.score_display
  end

  def life_reload
    self.life_display = Text.new("life x #{ self.life }", x: 30 )
    self.score_display
  end

  private

  def move_(axis)
    if send("#{axis.to_s}_flug")
      eval("self.#{axis.to_s} += speed")
    else
      eval("self.#{axis.to_s} -= speed")
    end
    wall_refrect
  end

  def wall_refrect
    if self.contains?(self.x, 0)
      self.y_flug = true
    end
    if self.contains?(0, self.y)
      self.x_flug = true
    end
    if self.contains?(Window.width, self.y)
      self.x_flug = false
    end
  end

  def game_failed_check(state)
    if self.y > Window.height
      self.is_move = false
      self.x_flug = true
      self.y_flug = false
      self.life_display.remove
      self.life -= 1
      self.life_reload
      if life <= 0
        state.to_game_over
      end
    end
  end
end