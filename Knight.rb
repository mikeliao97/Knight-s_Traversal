require_relative './Board.rb'

class Knight
	

=begin 
My solution consists of using breadth-first search to find the needed value.
Then using targeted value to reverse find the starting_position. Including an array
that includes the moves used in both the process. Then find the similarities in both
array to get the steps needed.
=end
	def knight_moves(starting_pos, ending_pos)
		path_1 = knight_helper(starting_pos, ending_pos)
		puts path_1.inspect
		
		path_2 = knight_helper(ending_pos, starting_pos)
		puts path_2.inspect

		return (path_1 & path_2).inspect
				
	end
	
	def knight_helper(starting_pos, ending_pos)

		#have to use depth-first search
		queue = []
		queue << starting_pos
		
		#moves to keep track of the moves	
		moves = []

		while(queue.empty? == false)
			current_pos = queue.shift
			moves << current_pos
			
			if current_pos == ending_pos	#if they equal then break
				break
			end
			
			#check each move
			#top-top left
			if valid_move(current_pos, -1, 2)	
				queue << [current_pos[0] - 1, current_pos[1] + 2]
			end
			#top-top right
			if valid_move(current_pos, 1, 2)	
				queue << [current_pos[0] + 1, current_pos[1] + 2]
			end

			#top right	
			if valid_move(current_pos, 2, 1)	
				queue << [current_pos[0] + 2, current_pos[1] + 1]

			end

			#bottom right
			if valid_move(current_pos, 2, -1)	
				queue << [current_pos[0] + 2, current_pos[1] - 1]

			end



			#bottom-bottom rigth
			if valid_move(current_pos, 1, -2 )	
				queue << [current_pos[0] + 1, current_pos[1] - 2]

			end

 
			#bottom-bottom left 
			if valid_move(current_pos, -1, -2)	
				queue << [current_pos[0] - 1, current_pos[1] - 2]

			end



			#bottom-left
			if valid_move(current_pos, -2, -1)	
				queue << [current_pos[0] - 2, current_pos[1] -1]

			end


			#top-left
			if valid_move(current_pos, -2, 1)	
				queue << [current_pos[0] - 2, current_pos[1] + 1]

			end

		end
		return moves

	end


	def valid_move(move, x, y)
		valid_move = true
		if(move[0] + x < 0 || move[0] + x > 7)
			valid_move = false	
		end
	
		if(move[1] + y < 0 || move[1] + y > 7)
			valid_move = false
		end
		
		return valid_move
	end

end



new_knight = Knight.new
puts new_knight.knight_moves([0,0], [3,3])
