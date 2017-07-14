# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

u1 = User.create(username: "Brooke", password: "aloogobiburrito")
u2 = User.create(username: "Claire", password: "mounttamhikes")
u3 = User.create(username: "Scott", password: "handshakes")
u4 = User.create(username: "Quinn", password: "dumbledore")

sub1 = Sub.create(title: "App Academy Drama", description: "Staff Secrets", user_id: u1.id)
sub2 = Sub.create(title: "Dogs", description: "Better than cats (TM)", user_id: u4.id)
sub3 = Sub.create(title: "Food", description: "Always hungry.", user_id: u1.id)

Post.create!(title: "Who stole my lunch?", user_id: u1.id, content: "No seriously, guys, where is it?", sub_ids: [sub1.id, sub3.id])
Post.create!(title: "Reggie the Reject Bear: MISSING", user_id: u3.id, content: "Discovered at 12:35am this morning.", sub_ids: [sub1.id])
Post.create!(title: "Newfoundland/Daschund friendship", user_id: u4.id, content: "Thoughts?", sub_ids: [sub2.id])
Post.create!(title: "Cookies", user_id: u2.id, content: "These are so good! \n http://allrecipes.com/recipe/11032/oatmeal-craisin-cookies/?scale=12&ismetric=0", sub_ids: [sub3.id])
Post.create!(title: "Curry Up Now", user_id: u1.id, content: "Aloo Gobi Burrito forever <3", sub_ids: [sub3.id])

# Comment.create(post_id: 1, user_id: 2, body: "Not me...")
# Comment.create(post_id: 2, user_id: 1, body: "I saw Jeff leaving the building with a large duffel bag last night. Could've been smuggling him out.")
# Comment.create(post_id: 3, user_id: 3, body: "That's us!")
# Comment.create(post_id: 4, user_id: 4, body: "Let's ask Jordan to make them :)")
# Comment.create(post_id: 5, user_id: 2, body: "Punjabi by Nature burrito forever!")
