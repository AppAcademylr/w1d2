require "./card"
class Board
  attr_reader :grid
  def initialize(grid = Array.new(4) { Array.new(3, nil) })
    @grid = grid
  end

  def populate
    len = self.grid.flatten.length/2
    temp = Array.new(len)

    temp.each.with_index do |_,idx|
      random_number = rand(0..51) until !(temp.include?(random_number))
      temp[idx] = random_number
    end

    temp *= 2

    temp.shuffle!

    len_row = self.grid.length
    len_col = self.grid[0].length

    (len_row).times do |i|
       (len_col).times do |j|
         grid[i][j] = Card.new(temp.pop)
       end
    end
    puts temp.to_s
    @grid
  end

  def render
    temp_grid = Array.new(self.grid.length) { Array.new(self.grid[0].length, nil) }
    self.grid.each.with_index do |el1, idx1|
      el1.each.with_index do |el2, idx2|
        if el2.f_show
          temp_grid[idx1][idx2] = el2.to_s
        elsif el2.f_del
          temp_grid[idx1][idx2] = "  "
        else
          temp_grid[idx1][idx2] = "|*|"
        end
      end
    end
    temp_grid
  end

  def won?
    self.grid.each.with_index do |el1, idx1|
      el1.each.with_index do |el2, idx2|
        return false unless el2.f_del
      end
    end
    true
  end

  def reveal(guess_pos)
    a,b = guess_pos
    self.grid[a][b].reveal
    self.grid[a][b].f_val
  end
end
