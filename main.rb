require './config'

bar = Bar.new
ball = Ball.new

on :key do |event|
  bar.move(event)
end

show