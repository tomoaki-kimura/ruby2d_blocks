require './config'

bar = Bar.new
ball = Ball.new
ball.follow(bar)

update do
  ball.move
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

show