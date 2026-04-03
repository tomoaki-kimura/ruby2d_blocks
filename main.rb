require "ruby2d"
require "./ball"
require "./bar"

ball = Ball.new
bar = Bar.new
ball.follow(bar)

on :key_down do |event|
  if !ball.is_move && event.key == "space"
    ball.is_move = true
  end
end

on :key do |event|
  bar.move(event)
end

update do
  if ball.is_move
    ball.move
    bar.refrect(ball)
  else
    ball.follow(bar)
  end
end

show