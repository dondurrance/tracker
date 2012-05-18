namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create( :login => 'admin', :password => 'admin', :password_confirmation => 'admin' )
  end

  desc "default_ticket"
  task :default_ticket => :environment do
    Ticket.create( :subject => "Initial ticket", :description => "This is a default ticket created for demonstration purposes.")
  end

  desc "default_role"
  task :default_role => :environment do
    role = Role.create( :name => "Admin" )
  User.find(:first).roles << role
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :default_ticket, :default_role]

end
