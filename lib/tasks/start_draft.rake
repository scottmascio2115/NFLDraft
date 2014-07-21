namespace :draft do

  desc "Start the draft"
  task :start => :environment do
    order = Pick.all
    players = Player.all.to_a

    order.each do |pick|
      selection = Team.find_by_name(pick.team_name)
      player = players.delete_at(rand(players.length))
      puts "The #{selection.name} take #{player.name}"
      selection.acquire(player)
      pick.update_attribute(:player, player)
      player.update_attribute(:taken_number, pick.id)
    end
  end
end
