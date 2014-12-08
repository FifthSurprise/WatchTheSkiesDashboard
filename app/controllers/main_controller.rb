class MainController < ApplicationController
  
  def index
    #access main dashboard
    @game = Game.first
    @next_round = @game.next_round.getlocal.strftime("%l:%M:%S %p")
    @terror = TerrorTracker.sum(:amount)
    @time_til_next_round = (@game.next_round - Time.now)
    p "Next round time is : #{@time_til_next_round}"
  end

  def reset_game
    if Rails.env.production?
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
    else
      system 'rake db:reset'
    end
    redirect_to root_path
  end

  def admin
  end
end
