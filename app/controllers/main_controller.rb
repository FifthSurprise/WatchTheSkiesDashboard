class MainController < ApplicationController
  def index
    #access main dashboard
    @game = update()
    unless @game.paused
      @next_round = @game.next_round.getlocal.strftime("%l:%M:%S %p")
    else
      @next_round = (@game.next_round + (Time.now - @game.pause_time)).getlocal.strftime("%l:%M:%S %p")
    end 
    @terror = TerrorTracker.sum(:amount)
    @time_til_next_round = (@game.next_round - Time.now)*6
    p "Next round time is : #{@time_til_next_round}"

    data = {}
    data[:game] = @game
    data[:next_round] = @next_round
    data[:time_til_next_round] = (@game.next_round - Time.now)
    data[:terror] = @terror
    respond_to do |format|
      format.html
      format.json {render json: data}
    end
  end

  def reset_game
      Game.delete_all
      TerrorTracker.delete_all
      g = Game.create()
      g.control_message = "Welcome to Watch the Skies!"
      g.current_round = 0
      g.next_round = g.created_at + (15*60)
      g.paused = true
      g.pause_time = g.created_at
      g.save

      t = TerrorTracker.create()
      t.description = "Initial setting of Terror level"
      t.amount = 0
      t.round = 0
      t.save

    redirect_to root_path
  end

  def admin
    @game = Game.first
  end

  def update_control_message
    @game = Game.first
    @game.control_message = params[:game][:control_message]
    @game.save
    redirect_to admin_controls_path
  end

  def toggle_game_status
    @game = Game.first
    
    #Game was paused
    unless @game.paused
      @game.next_round = @game.next_round + (Time.now - @game.pause_time)
    else
      @game.pause_time = Time.now
    end
    @game.paused = !@game.paused
    @game.save
    redirect_to admin_controls_path
  end

  private
  def update
    game = Game.first
    unless game.paused
      if game.next_round < Time.now
        game.current_round +=1
        game.next_round = game.next_round + (15*60)
        game.save()
      end
    end
    return game
  end
end
