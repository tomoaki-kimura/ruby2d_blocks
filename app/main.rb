require './config'

bar = Bar.new
ball = Ball.new
ball.follow(bar)
main_title = MainTitle.new
state = State.new

update do
  case state.screen_status
  when :game_start
    if ball.is_move
      ball.move
      bar.refrect(ball)
    else
      ball.follow(bar)
    end
  when :main_title
    tick = 0
    update do
      main_title.color_change if tick % 5 == 0
      tick += 1
    end
  end
end

on :key do |event|
  case state.screen_status
  when :game_start
    bar.move(event)
    ball.follow(bar) unless ball.is_move
  when :main_title
  end
end

on :key_down do |event|
  case state.screen_status
  when :game_start
    if event.key == "space" && !ball.is_move
      ball.is_move = true
    end
  when :main_title
  end
end

show