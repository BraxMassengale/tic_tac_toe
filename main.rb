
class Game

  def initialize
    self.rules
    @total_turns = 0
    @locations = [" ", " ",  " ", " ", " ",  " ", " ", " ",  " "]
  end

  def rules
    puts "This is a simple game of tic tac toe."
    puts "2 players will take turns selecting a quadrant to place a marker: X or O"
    puts "The quadrants are as follows:"
    puts [" 1 " "|" " 2 " "|" " 3 "]
    puts separator = "------------"
    puts [" 4 " "|" " 5 " "|" " 6 "]
    puts separator
    puts [" 7 " "|" " 8 " "|" " 9 "]
    puts ".....THE GAME STARTS NOW....."
  end

  def update_board
    puts [" #{@locations[0]} " "|" " #{@locations[1]} " "|" " #{@locations[2]} "]
    puts seperator = "------------"
    puts [" #{@locations[3]} " "|" " #{@locations[4]} " "|" " #{@locations[5]} "]
    puts seperator
    puts [" #{@locations[6]} " "|" " #{@locations[7]} " "|" " #{@locations[8]} "]
  end

  def quadrant_vacant?(quadrant)
    if @locations[quadrant] == " "
      true
    else
      false
    end
  end

  def quadrant_occupied
    puts "That quadrant is already occupied. Please select a different one."
  end

  def select_quadrant(player)
    choice = gets.chomp
    case choice
    when "1"
      if quadrant_vacant?(0)
      puts "quad 1"
        @locations[0] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    when "2"
      if quadrant_vacant?(1)
      puts "quad 2"
        @locations[1] = player
      @total_turns += 1
      else
        self.quadrant_occupied
        end
    when "3"
      if quadrant_vacant?(2)
      puts "quad 3"
        @locations[2] = player
      @total_turns += 1
      else
        self.quadrant_occupied
        end
    when "4"
      if quadrant_vacant?(3)
      puts "quad 4"
      @locations[3] = player
      @total_turns += 1
      end
    when "5"
      if quadrant_vacant?(4)
      puts "quad 5"
      @locations[4] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    when "6"
      if quadrant_vacant?(5)
      puts "quad 6"
      @locations[5] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    when "7"
      if quadrant_vacant?(6)
      puts "quad 7"
      @locations[6] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    when "8"
      if quadrant_vacant?(7)
      puts "quad 8"
      @locations[7] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    when "9"
      if quadrant_vacant?(8)
      puts "quad 9"
      @locations[8] = player
      @total_turns += 1
      else
        self.quadrant_occupied
      end
    else
      puts "there's been an error with the select_quadrant method"
    end
  end

  def place_marker(player)

    if player === "X"
      puts "Which quadrant would you like to place an X in?"
      select_quadrant(player)
    elsif player === "O"
      puts "Which quadrant would you like to place an O in?"
      select_quadrant(player)
      else
      puts "Please select either X or O"
      self
    end
  end

  def turn(player)
    if player === "X"
      puts "Player X's turn"
      self.place_marker(player)
      self.update_board
    end

    if player === "O"
      puts "Player O's turn"
      self.place_marker(player)
      self.update_board
    end
  end

  def play
    while @total_turns != 9
      if @total_turns % 2 == 0
        self.turn("X")
        self.winner?("X")
      elsif @total_turns % 2 == 1
        self.turn("O")
        self.winner?("O")
      else
        puts "There was an error with the play method"
      end
    end
  end

  def game_won(player)
    @total_turns = 9
    puts stars = "**************************************************************************"
    puts stars
    puts " "
    puts "            CONGRATULATIONS PLAYER #{player}, YOU HAVE WON THE GAME!             "
    puts " "
    puts stars
    puts stars

  end

  def winner?(player)
    if @locations[0] == player && @locations[1] == player && @locations[2] == player
      game_won(player) #Horizontal Top
      elsif @locations[3] == player && @locations[4] == player && @locations[5] == player
        game_won(player) #Horizontal Middle
      elsif @locations[6] == player && @locations[7] == player && @locations[8] == player
        game_won(player) #Horizontal Bottom
      elsif @locations[0] == player && @locations[3] == player && @locations[6] == player
        game_won(player) #Vertical Left
      elsif @locations[1] == player && @locations[4] == player && @locations[7] == player
        game_won(player) #Vertical Middle
      elsif @locations[2] == player && @locations[5] == player && @locations[8] == player
        game_won(player) #Vertical Right
      elsif @locations[0] == player && @locations[4] == player && @locations[8] == player
        game_won(player) #Diagnol Left to Right
      elsif @locations[2] == player && @locations[4] == player && @locations[6] == player
        game_won(player) #Diagnol Right to Left
    else
       nil
    end
  end
end

game = Game.new
game.play
