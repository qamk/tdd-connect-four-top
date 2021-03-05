# frozen-string-literal: true

require_relative './player.rb'
require_relative './rules.rb'
require_relative './display.rb'

# Plays the game
class Game
  attr_reader :players, :grid, :winner
  include Rules
  include Display
  def initialize
    @players = [name_players, name_players]
    # @discs = [players[0].disc, players[1].disc]
    @grid = Array.new(6) { Array.new(7) { '' } }
  end

  def name_players
    ask_for_name
    name = gets.chomp
    Player.new(name)
  end

  def make_player_discs
    ask_for_disk_colour
    players.each do |player|
      ask_for_disk_colour(player)
      disc_code = gets.chomp.downcase
      player.create_disc(disc_code)
    end
  end

  def play_game
    welcome
    @winner = make_move
    winner_announcement(winner)
  end

  def make_move
    @players.cycle do |player|
      column = request_column_input(player)
      add_disc(column, player.disc)
      return player if scan_grid(grid)
    end
  end

  def add_disc(column, disc)
    grid.each_with_index do |row, row_index|
      next unless row[column] == ''

      @grid[row_index][column] = disc and break
    end
  end

  def request_column_input(player)
    loop do
      request_column_message(player)
      column = gets.chomp.to_i
      return (column - 1) if valid_column?(column)

      invalid_column_message
    end
  end

  def valid_column?(column)
    column.to_i.between?(1, 7)
  end

end