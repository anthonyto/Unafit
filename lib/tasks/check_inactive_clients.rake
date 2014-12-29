clients = User.where(role: "client")
active_clients = clients.where(active: true)

clients.each do |client|
  # add 30 days to the last payment, if that time is less than now, than client's subscription is expired
  if 30.days.since(client.client_profile.last_payment) < now
    client.client_profile.active = false
    puts "UPDATED: #{client.inspect}"
  end
end
