class GameStatus
  def initialize
    @state = :home
  end

  def home
    self.state = :home
  end
end