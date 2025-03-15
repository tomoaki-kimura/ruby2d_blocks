require './config'

bar = Bar.new
ball = Ball.new
ball.follow(bar)
main_title = MainTitle.new
state = State.new
tick = 0
blocks = []
game_over_message = GameOver.new

update do
  case state.screen_status
  when :game_start
    if ball.is_move
      ball.move(state)
      bar.refrect(ball)
      blocks.each do |block|
        block.hit(ball, state) if block.is_active
      end
    else
      ball.follow(bar)
    end
  when :main_title
    main_title.color_change if tick % 5 == 0
  when :game_over
    game_over_message.add
  when :stage_loading
    blocks = Block.start(state)
    state.to_game_start
  end

  tick += 1
  p state.blocks_size
  if state.blocks_size <= 0
    state.to_stage_loading
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
    if event.key == "space"
      blocks = Block.start(state)
      state.blocks_size = blocks.select { |block| block.is_breakable }.size
      main_title.remove
      state.to_game_start
    end
  when :game_over
    if event.key == "c"
      game_over_message.remove
      state.to_game_start
      ball.remove
      ball.score_display.remove
      ball.life_display.remove
      ball = Ball.new
    elsif event.key == "r"
      game_over_message.remove
      state.to_game_start
      ball.remove
      ball.score_display.remove
      ball.life_display.remove
      ball = Ball.new
      blocks.each { |block| block.remove }
      blocks = Block.start(state)
      state.blocks_size = blocks.select { |block| block.is_breakable }.size
    end
  end
end

show