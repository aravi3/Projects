class Board
  require 'byebug'

  def default_grid
    grid = Array.new(4) { Array.new(4) }
    grid
  end

  def initialize(cards = [], grid = default_grid)
    @cards = cards
    2.times do
      8.times do |i|
        @cards << Card.new(i + 1)
      end
    end  # [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3...]
    # @cards.shuffle
    @grid = grid
    populate
  end

  def populate
    @rows = @grid.length
    @cols = @grid.first.length
    (0...@rows).each do |row|
      (0...@cols).each do |col|

        pos = [row, col]
        @cards.shuffle!
        self[pos] = @cards.pop
      end
    end
  end

  def render
    system("clear")

    (0...@rows).each do |row|
      (0...@cols).each do |col|
        #debugger
        if self[[row, col]].face_up
          print self[[row, col]].value.to_s
        # elsif matched?
        #   print "_"
        else
          print "?"
        end
      end
      print "\n"
    end

    sleep(1.5)


  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end

  def won?(matches)
    matches == 8
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end



end
