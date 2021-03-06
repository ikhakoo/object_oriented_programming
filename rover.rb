class Rover

	HEIGHT = 10
	WIDTH = 10

	def initialize(init_x, init_y, init_direction)
		@x = init_x
		@y = init_y
		@direction = init_direction
		@dead = false
	end

	def process_input(input)
		values = input.split("")
		values.each do |value|
			read_instruction(value)
			draw
		end
	end

	def read_instruction(value)
		if value == "L"
			turn_left
		elsif value == "R"
			turn_right
		elsif value == "M"
			move_forward
		end
	end

	def move_forward
		if @dead
			@dead += 1
			return
		end

		if @direction == "N"
			@y += 1
		elsif @direction == "S"
			@y -= 1
		elsif @direction == "E"
			@x += 1
		elsif @direction == "W"
			@x -= 1
		end

		if off_the_grid?(@x, @y)
			@dead = @dead || 0
		end
	end

	def turn_left
		if @direction == "N"
			@direction = "W"
		elsif @direction == "W"
			@direction = "S"
		elsif @direction == "S"
			@direction = "E"
		elsif @direction == "E"
			@direction = "N"
		end
		
	end

	def turn_right
		if @direction == "N"
			@direction = "E"
		elsif @direction == "E"
			@direction = "S"
		elsif @direction == "S"
			@direction = "W"
		elsif @direction == "W"
			@direction = "N"
		end
	end

	def off_the_grid?(x,y)
		y < 0 or y > HEIGHT or x < 0 or x > WIDTH
	end

	def rover_at?(x,y)
		@x == x and @y == y
	end

	DEADS = [
		"YOU DEAD BITCH",
		"YOU SO DEAD BITCH",
		"YOU AS DEAD AS THEY COME",
		"Bereft of life, you rest peace",
		"You have rung down the curtain and joined the choir invisible",
		"YOU ARE AN EX-ROVER",
		"",
		"...so dead."
	]

	def draw
		if STDIN.tty?
			clear_screen

			if @dead
				puts DEADS[@dead % DEADS.size]
			else
				puts self
			end

			(HEIGHT+1).downto(-1) do |y|
				(-1..WIDTH+1).each do |x|

					if off_the_grid?(x,y)
						if rover_at?(x,y)  
							print "%@."
						else
							print "..."
						end
					elsif rover_at?(x,y)
						print " #{@direction} "
					else
						print "   "
					end

				end

				puts
			end
			sleep 1
			sleep 1 if @dead
		else
			# dumb output
			puts self
		end				
	end
	
	def clear_screen
		print "\e[2J\e[;H"
	end

	def to_s
		"I am at #{@x}, #{@y}, facing: #{@direction}"
	end
end


my_rover = Rover.new(1, 1, "N")
my_rover.process_input("MMRMMLMMLMMMMMMMMMM")
