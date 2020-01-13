def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored (player)
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      if i[:player_name] === player
        return i[:points] 
      end
    end
  end
end

def shoe_size (player)
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      if i[:player_name] === player
        return i[:shoe]
      end
    end
  end
end

def team_colors (team)
  game_hash.each do |home_away, details|
    if details[:team_name] === team
      return details[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |home_away, details|
    name = details[:team_name]
    names << name
  end
  names
end

def player_numbers (team)
  game_hash.each do |home_away, details|
    if details[:team_name] == team
      return details[:players].map {|x| x[:number]}
    end
  end
end

def player_stats (player)
  stats = {}
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      if i[:player_name] === player
        stats[:number] = i[:number]
        stats[:shoe] = i[:shoe]
        stats[:points] = i[:points]
        stats[:rebounds] = i[:rebounds]
        stats[:assists] = i[:assists]
        stats[:steals] = i[:steals]
        stats[:blocks] = i[:blocks]
        stats[:slam_dunks] = i[:slam_dunks]
      end
    end
  end
  stats
end

def big_shoe_rebounds
  stats = {}
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      player = i[:player_name]
      stats[player] = i[:shoe]
    end
  end
  big_shoe = stats.max_by{|player, shoe| shoe}[0]
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      if i[:player_name] == big_shoe
        return i[:rebounds]
      end
    end
  end
end

def most_points_scored
  stats = {}
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      player = i[:player_name]
      stats[player] = i[:points]
    end
  end
  stats.max_by{|player, points| points}[0]
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |i|
    home_score += i[:points]
  end
  game_hash[:away][:players].each do |i|
    away_score += i[:points]
  end
  if home_score > away_score
  "Brooklyn Nets"
  else 
  "Charlotte Hornets"
  end
end

def player_with_longest_name
  names = []
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      names << i[:player_name]
    end
  end
  names.max_by {|x| x.length}
end

def long_name_steals_a_ton
  stats = {}
  game_hash.each do |home_away, details|
    details[:players].each do |i|
      player = i[:player_name]
      stats[player] = i[:steals]
    end
  end
  most_steals = stats.max_by{|player, steals| steals}[0]
  if most_steals == player_with_longest_name
    return true
  end
end











