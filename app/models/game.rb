class Game < ActiveRecord::Base
  def self.reset
    Game.delete_all
    TerrorTracker.delete_all
    PublicRelation.delete_all

    g = Game.create()
    g.control_message = "Welcome to Watch the Skies!"
    g.current_round = 0
    g.next_round = g.created_at + 30*60
    g.pause_time = g.created_at
    g.paused = true
    g.rioters = 0
    g.save

    t = TerrorTracker.create()
    t.description = "Initial setting of Terror level"
    t.amount = 0
    t.round = 0
    t.save
  end
end
