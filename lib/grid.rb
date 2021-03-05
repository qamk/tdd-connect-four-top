# frozen-string-literal: true

# Module to make and display grid
module Grid
  # def make_grid(grid)
  #   grid_for_display = grid.map do |col|
  #     next if col.length == 7

  #     empty_discs_to_add = ["\e[97m\u25CF\e[0m"] * (7 - col.size)
  #     col.push(empty_discs_to_add)
  #   end
  # end

  def display_grid(grid)
    (0..6).times do |index|
      grid.each { |column| print("| #{column[index]}") }
      puts
    end
    print "#{'\/' * 7} "
  end
end
