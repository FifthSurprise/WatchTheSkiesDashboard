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
    system 'rake db:reset'
    redirect_to root_path
  end

  def admin
  end
end
