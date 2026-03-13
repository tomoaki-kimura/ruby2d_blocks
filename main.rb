require "ruby2d"
require "./ball"
require "./bar"

ball = Ball.new
bar = Bar.new
ball.follow(bar)

on :key do |event|
  bar.move(event)
end

update do 
  ball.follow(bar)
end

show