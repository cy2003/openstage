# OWNERS (no fields)

# PROMOTERS (no fields)

# PERFORMERS
#   t.string   "category"
#   t.string   "genre"
#   t.string   "description"

# USERS
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "password_digest"
#   t.string   "email"
#   t.integer  "phone_number"
#   t.integer  "owner_id"
#   t.integer  "performer_id"
#   t.integer  "promoter_id"

# TIME SLOTS
#   t.integer  "venue_id"
#   t.integer  "performer_id"
#   t.datetime "start_time"
#   t.datetime "end_time"
#   t.string   "age_restriction", default: "All Ages"
#   t.string   "status",          default: "Available"

# VENUES
#   t.string   "name"
#   t.string   "street_address_1"
#   t.string   "street_address_2"
#   t.string   "city"
#   t.string   "state"
#   t.integer  "zip_code"
#   t.integer  "promoter_id"
#   t.integer  "owner_id"

# MUST CREATE USERS FIRST




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
flatiron.owner = avi_owner
flatiron.promoter = val_promoter
flatiron.save

one_world = Venue.new(name: "One World Trade Center", street_address_1: "1 World Trade Center", street_address_2: "Suite 100", city: "New York", state: "NY", zip_code: 10001)
one_world.owner = rob_owner
one_world.promoter = ian_promoter
one_world.save
