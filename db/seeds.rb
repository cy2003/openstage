avi_user = User.create(first_name: "Avi", last_name: "Flombaum", password: "hi", email: "avi@flatironschool.com", phone_number: "8889580569")
avi_owner = Owner.new
avi_owner.user = avi_user
avi_owner.save

rob_user = User.create(first_name: "Rob", last_name: "Hitt", password: "hi", email: "robhitt@gmail.com", phone_number: "7326824952")
rob_owner = Owner.new
rob_owner.user = rob_user
rob_owner.save

cathy_user = User.create(first_name: "Cathy", last_name: "Yee", password: "hi", email: "catyyee@hotmail.com", phone_number: "9174498388")
cathy_performer = Performer.new
cathy_performer.user = cathy_user
cathy_performer.save

adam_user = User.create(first_name: "Adam", last_name: "Emrich", password: "hi", email: "adam.emrich@gmail.com", phone_number: "9149601509")
adam_performer = Performer.new
adam_performer.user = adam_user
adam_performer.save

val_user = User.create(first_name: "Valerie", last_name: "McCarthy", password: "1234", email: "valeriewilsonmccarthy@gmail.com", phone_number: "6502691263")
val_promoter = Promoter.new
val_promoter.user = val_user
val_promoter.save

ian_user = User.create(first_name: "Ian", last_name: "Candy", password: "1234", email: "ian.candy@flatironschool.com", phone_number: "212-334-4446")
ian_promoter = Promoter.new
ian_promoter.user = ian_user
ian_promoter.save

# CREATE VENUES
flatiron = Venue.new(name: "Flatiron School", street_address_1: "11 Broadyway", street_address_2: "Suite 215", city: "New York", state: "NY", zip_code: 10004)
avi_owner.venues << flatiron
flatiron.promoter = val_promoter
flatiron.save

one_world = Venue.new(name: "One World Trade Center", street_address_1: "1 World Trade Center", street_address_2: "Suite 100", city: "New York", state: "NY", zip_code: 10001)
rob_owner.venues << one_world
one_world.promoter = ian_promoter
one_world.save
