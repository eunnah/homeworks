class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |idx|
      @cups << Array.new(4, :stone) unless idx == 6 || idx == 13
      @cups << [] if idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13 || @cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)


    if current_player_name == @name1
      blocked_cup = 13
    else
      blocked_cup = 6
    end

    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    counter = 0
    index = 0
    while counter < num_stones
      index += 1
      if (start_pos+index)%14 != blocked_cup
        @cups[(start_pos+index)%14] << :stone
        counter += 1
      end
    end
    render

    next_turn((start_pos+index)%14)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |idx| @cups[idx].empty? } ||
    (7..12).all? { |idx| @cups[idx].empty? }

  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    else
      return :draw
    end
  end
end
