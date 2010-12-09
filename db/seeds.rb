# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Category.create([{ :name => 'Anal' }, { :name => 'Ass' }, 
  { :name => 'Amateur' }, { :name => 'Blonde' }, 
  { :name => 'Fisting' }, { :name => 'Straight' }, 
  { :name => 'Gay' }, { :name => 'Dating' }, 
  { :name => 'Cam' }, { :name => 'Toys' }])

u = User.create(:name => 'admin', :firstname => 'Admin', :surname => 'Admin', 
  :password => 'admin', :role => 'Admin', :activated => true, :email => 'admin@nowhere.com');
  
u.password = u.encrypt_password(u.password)
u.save!

u = User.create(:name => 'editor', :firstname => 'Editor', :surname => 'Editor', 
  :password => 'editor', :role => 'Editor', :activated => true, :email => 'editor@nowhere.com');
  
u.password = u.encrypt_password(u.password)
u.save!


