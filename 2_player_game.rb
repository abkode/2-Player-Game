
@answer 
@player1_input 
@player2_input
@player1_name 
@player2_name
@player1_score = 0
@player2_score = 0
@player1_lives = 3
@player2_lives = 3

def get_player_name
  puts "Please type player 1 name:"
  @player1_name = gets.chomp

  puts "Please type player 2 name:"
  @player2_name = gets.chomp

end

def generate_question

  first_number = rand(1..20)
  second_number = rand(1..20)
  @answer = first_number + second_number
  puts "What does #{first_number} plus #{second_number} equal?"
  
end


def prompt_player_for_answer

  print "#{@player1_name}: "
  @player1_input = gets.chomp
  
  puts ""
  print "#{@player2_name}: "
  @player2_input = gets.chomp

end

def verify_answer

   (@player1_input.to_i == @answer) ? @player1_score += 1 :  @player1_lives -=  1 
   (@player2_input.to_i == @answer) ? @player2_score += 1 :  @player2_lives  -= 1

end

get_player_name

begin 
  
  puts generate_question
  prompt_player_for_answer()
  verify_answer

end while not(@player1_lives == 0  || @player2_lives == 0)


if (@player1_score > @player2_score && @player1_lives > @player2_lives)

    puts ""
    puts  "#{@player1_name} won the game!  --  (Scores: #{@player1_score})"

  elsif (@player1_score < @player2_score && @player1_lives < @player2_lives)

    puts ""
    puts  "#{@player2_name} won the game!  --  (Scores: #{@player2_score})"

end  


