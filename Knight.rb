require_relative './Square.rb'

class Knight
	

=begin 
My solution consists of using breadth-first search to find the needed value.
Then using targeted value to reverse find the starting_position. Including an array
that includes the moves used in both the process. Then find the similarities in both
array to get the steps needed.
=end
	def knight_moves(starting_pos, ending_pos)
		square = Square.new(starting_pos, nil, nil)
		
		#once you initailize the square you want to return the founded ending
		#square 
		
		ending_square = knight_helper(square, ending_pos)
		
		puts "**********"
		puts ending_square


		return unravel(ending_square)
				
	end
	
	def knight_helper(starting_square, ending_pos)

		#have to use depth-first search
		queue = []
		queue << starting_square
		

		while(queue.empty? == false)
			current_square = queue.shift
			
			if current_square.position == ending_pos	#if they equal then break
				puts "I found it guys!"
				return current_square
			end
			
			#check each move
			#top-top left
			if valid_move(current_square, -1, 2)	
				queue << Square.new([current_square.position[0] -1, current_square.position[1] + 2], current_square, nil) 
			end
			#top-top righit
			if valid_move(current_square, 1, 2)	
					queue << Square.new([current_square.position[0] + 1, current_square.position[1] + 2], current_square, nil) 
			end

			#top right	
			if valid_move(current_square, 2, 1)	
				queue << Square.new([current_square.position[0] + 2, current_square.position[1] + 1], current_square, nil) 

			end

			#bottom right
			if valid_move(current_square, 2, -1)	
				queue << Square.new([current_square.position[0] + 2, current_square.position[1] -1], current_square, nil) 

			end



			#bottom-bottom rigth
			if valid_move(current_square, 1, -2 )	
					queue << Square.new([current_square.position[0] + 1, current_square.position[1] - 2], current_square, nil) 

			end

 
			#bottom-bottom left 
			if valid_move(current_square, -1, -2)	
				queue << Square.new([current_square.position[0] - 1, current_square.position[1] - 2], current_square, nil) 

			end



			#bottom-left
			if valid_move(current_square, -2, -1)	
				queue << Square.new([current_square.position[0] -2, current_square.position[1] -1], current_square, nil) 

			end


			#top-left
			if valid_move(current_square, -2, 1)	
				queue << Square.new([current_square.position[0] -2, current_square.position[1] + 1], current_square, nil) 

			end

		end
		return nil

	end


	def valid_move(move, x, y)
		valid_move = true
		if(move.position[0] + x < 0 || move.position[0] + x > 7)
			valid_move = false	
		end
	
		if(move.position[1] + y < 0 || move.position[1] + y > 7)
			valid_move = false
		end
		
		return valid_move
	end
	
	def unravel(square)
		count = 0
		path = []
		path << square
		while(square.parent)
			puts square.parent
			path << square.parent
			square = square.parent
			count += 1
		end
		
		puts "finished in #{count} moves"
		
		for i in 0..path.size - 1
			puts path[path.size - 1 - i].position.inspect 	
		end
	
	end

end



new_knight = Knight.new
puts new_knight.knight_moves([3,3], [4,3])
