require "./board"
require "./card"

class Game
  attr_accessor :board, :guessed_pos
  def initialize(guess_pos=nil)
    @guessed_pos = guess_pos
    @board = Board.new
    @board.populate
  end

  def play
    until self.board.won?
      self.board.render
      t1 = self.make_guess
      if self.guessed_pos
        if t1[0] == self.board.grid[guessed_pos[0]][guessed_pos[1]].f_val
          #delete cards
        else
          #hide both cards
        end
      else
        self.make_guess
      end
    end
  end

  def make_guess
    puts "Guess a Position"
    position = gets.chomp.split(",").map{|x| x.to_i}
    return [self.board.reveal(position), position]
  end

  def card_shown?
    self.board.grid.each.with_index do |el1, idx1|
      el1.each.with_index do |el2, idx2|
        if el2.f_show
          return el2.f_val
        end
      end
      false
  end
end
