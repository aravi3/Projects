# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
CatRentalRequest.destroy_all


c1 = Cat.create!(birth_date: "2015/01/20" , name: "Tabby", color: 'red', sex: 'm', description: "aaaaaaaa")
c2 = Cat.create!(birth_date: "2008/01/20" , name: "Maddy", color: 'brown', sex: 'f', description: "bbbbbbbbb")
c3 = Cat.create!(birth_date: "2009/01/20" , name: "Cabbie", color: 'black', sex: 'm', description: "cccccc")
c4 = Cat.create!(birth_date: "2000/01/20" , name: "Flabby", color: 'white', sex: 'f', description: "ddddddd")
c5 = Cat.create!(birth_date: "2012/01/20" , name: "Cathy", color: 'grey', sex: 'm', description: "eeeeee")
c6 = Cat.create!(birth_date: "1990/01/20" , name: "Munchy", color: 'red', sex: 'f', description: "ffffffff")


rr1 = CatRentalRequest.create!(cat_id: c1.id, start_date: "2015/07/20", end_date: "2018/01/01")
rr2 = CatRentalRequest.create!(cat_id: c2.id, start_date: "2016/01/20", end_date: "2018/01/01")
rr3 = CatRentalRequest.create!(cat_id: c3.id, start_date: "2017/01/20", end_date: "2018/01/01")
