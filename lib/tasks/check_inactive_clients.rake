namespace :subscriptions do 
  
  desc "Inactivate all users that have not paid within the last 30 days"
  task :check_inactive_clients => :environment do 

    clients = User.where(role: "client")
    active_clients = clients.select{ |client| client.client_profile.active == true }

    active_clients.each do |client|
      # add 30 days to the last payment, if that time is less than now, than client's subscription is expired
      puts "CLIENT: #{client.client_profile.inspect}"
      puts
      if 30.days.since(client.client_profile.last_payment) < DateTime.now
        client.client_profile.active = false
        client.client_profile.save
        puts "INACTIVATED: #{client.client_profile.inspect}"
        puts
      end
    end
  end
  
end