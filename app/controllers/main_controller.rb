class MainController < ApplicationController
  
  def index
    #access main dashboard
    @game = Game.first
    @next_round = @game.next_round.getlocal.strftime("%l:%M:%S %p")
    @terror = TerrorTracker.sum(:amount)
    @time_til_next_round = (@game.next_round - Time.now)*6
    p "Next round time is : #{@time_til_next_round}"

    data = {}
    data[:game] = @game
    data[:next_round] = @next_round
    data[:time_til_next_round] = (@game.next_round - Time.now)

    respond_to do |format|
      format.html
      format.json {render json: data}
    end
  end

  def reset_game
      Game.delete_all
      TerrorTracker.delete_all
      g = Game.create()
      g.next_round = g.created_at + 15*60
      g.paused = true
      g.save

      t = TerrorTracker.create()
      t.description = "Initial setting of Terror level"
      t.amount = 0
      t.round = 0
      t.save

    redirect_to root_path
  end

  def admin
  end
end
