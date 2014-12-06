class MainController < ApplicationController
  
  def main
    #access main
    @trackerTotal = TerrorTracker.total
    
  end
end
