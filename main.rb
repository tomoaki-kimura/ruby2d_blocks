require "ruby2d"
require "./ball"
require "./bar"
require "./block"

set(
  width: 800,
  height: 600
)

@status = :game_start

ball = Ball.new
bar = Bar.new
blocks = Block.set_blocks

ball.follow(bar)

on :key_down do |event|
  if !ball.is_move && event.key == "space"
    ball.is_move = true
  end
end

on :key do |event|
  bar.move(event)
end

tick = 0

update do
  case @status
  when :game_start
    ball.speed = rand(3..10) if tick % 60 == 0
    if ball.is_move
      ball.move
      bar.refrect(ball)
      Block.broken_by(ball, blocks)
    else
      ball.follow(bar)
    end
    tick += 1
    @status = :game_clear if blocks.size == 0
  when :game_clear
    p "clear"
  end
end

show