require './config'

bar = Bar.new
ball = Ball.new
ball.follow(bar)

title = Text.new("BLOCKS",
  size: 100,
  x: 200,
  y: 100)
message = Text.new("press key 'space' to start",
  size: 30,
  x: 210,
  y: 300)

if false
  update do
    if ball.is_move
      ball.move
      bar.refrect(ball)
    else
      ball.follow(bar)
    end
  end

  on :key do |event|
    bar.move(event)
    ball.follow(bar) unless ball.is_move
  end

  on :key_down do |event|
    if event.key == "space" && !ball.is_move
      ball.is_move = true
    end
  end
end

show