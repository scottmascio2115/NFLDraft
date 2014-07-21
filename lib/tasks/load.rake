require 'csv'

namespace :load do

  desc "Load Players in the Draft"
  task :players => :environment do
    player_csv = Rails.root.join('players.csv')

    CSV.foreach(player_csv, :headers => true) do |row|
      Player.find_or_create_by(name: row[0], position: row[1])
    end
  end

  desc "Load Order of the Draft"
  task :order => :environment do
    order_csv = Rails.root.join('order.csv')

    CSV.foreach(order_csv, :headers => true) do |row|
      Pick.find_or_create_by(round: row[0], pick: row[1], team_name: row[2])
    end
  end

  desc "Load Teams in the Draft"
  task :teams => :environment do
    team_csv = Rails.root.join('teams.csv')

    CSV.foreach(team_csv, :headers => true) do |row|
      Team.find_or_create_by(name: row[0], division: row[1])
    end

    Team.consistent_name
    teams = Team.all

    teams.each do |team|
      team.update_attribute(:name, team.name.strip)
    end
  end

  task :all => [:players, :order, :teams] do
    puts 'Loading players.csv, order.csv, team.csv'
  end
end
