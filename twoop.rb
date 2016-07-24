
class Player

  $player1_point = 0
  $player2_point = 0
  $player1_lives = 3
  $player2_lives = 3

  def initialize(player1_inp, player2_inp, ansr, player1, player2)
    @player1_inp = player1_inp
    @player2_inp = player2_inp
    @ansr = ansr
    @player1 = player1
    @player2 = player2

  end 

 attr_accessor :player1, :player2

  def gain_point

    if (@player1_inp.to_i == @ansr)

        $player1_point += 1
      
      elsif (@player2_inp.to_i == @ansr)

        $player2_point += 1
     
     end
  end


  def lose_life

    if (@player1_inp.to_i != @ansr)

      $player1_lives -=  1

    elsif (@player2_inp.to_i != @ansr)
      
      $player2_lives  -=  1

    end
  end

end


@answer 
@player1_input 
@player2_input
@player_names = []

def get_player_name

  puts "First Player Name:"
  @player_names << gets.chomp

  puts "Second Player Name:"
  @player_names << gets.chomp

end


def generate_question

  first_number = rand(1..20)
  second_number = rand(1..20)
  @answer = first_number + second_number
  puts "What does #{first_number} plus #{second_number} equal?"

end


def prompt_player_for_answer

  print "#{@player_names[0]}: "
  @player1_input = gets.chomp
  
  puts ""
  print "#{@player_names[1]}: "
  @player2_input = gets.chomp

end

get_player_name

while not($player1_lives.to_i == 0  || $player2_lives.to_i == 0)
  
  puts generate_question
  prompt_player_for_answer()
  scoring = Player.new(@player1_input, @player2_input, @answer, @player_names[0], @player_names[1])
  scoring.gain_point
  scoring.lose_life

end 


if ($player1_point.to_i > $player2_point.to_i && $player1_lives.to_i > $player2_lives.to_i)
   
    puts ""
    puts  "#{scoring.player1} won the game!  --  (Scores: #{$player1_point})"

  elsif ($player1_point.to_i < $player2_point.to_i && $player1_lives.to_i < $player2_lives.to_i)

    puts ""
    puts  "#{scoring.player2} won the game!  --  (Scores: #{$player2_point})"

end  
