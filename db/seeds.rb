# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

g = Game.create()
g.control_message = "Welcome to Watch the Skies!"
g.next_round = g.created_at + 15*60
g.pause_time = g.created_at
g.paused = true
g.save

t = TerrorTracker.create()
t.description = "Initial setting of Terror level"
t.amount = 0
t.round = 0
t.save

a = Admin.create()
a.email = "wts@wts.com"
a.password='swordfish'
a.password_confirmation='swordfish'
a.save