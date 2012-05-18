namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create( :login => 'admin', :password => 'admin', :password_confirmation => 'admin' )
  end

  desc "Add the default ticket"
  task :default_ticket => :environment do
    Ticket.create( :subject => "Initial ticket", :description => "This is a default ticket created for demonstration purposes.", :status => "Closed")
  end

  desc "Add the admin role"
  task :default_role => :environment do
    role = Role.create( :name => "Admin" )
  User.find(:first).roles << role
  end

  desc "Add the default location and room"
  task :default_room => :environment do
    location = Location.create( :name => "City Hall" )
    room = Room.create( :name => "Mayor's Office" )
    location.rooms << room
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :default_ticket, :default_role, :default_room]

end
