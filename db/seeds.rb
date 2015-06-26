# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Game.reset

l = Launchstart.create()
l.value = false
l.save

a = Admin.create()
a.email = "wts@wts.com"
a.password='macbeth'
a.password_confirmation='macbet'
a.save