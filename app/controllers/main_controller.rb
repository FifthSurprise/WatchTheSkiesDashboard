class MainController < ApplicationController
  
  def index
    #access main dashboard
    @game = Game.first
    @next_round = @game.next_round.getlocal.strftime("%l:%M:%S %p")
    @terror = TerrorTracker.sum(:amount)
  end
end
