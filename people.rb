class	Person
	attr_writer :name
	def initialize(name)
		@name = name
	end
	def to_s
		"Hi, my name is #{@name}"
	end
end	

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object!"
	end
end


### The below code will not work because the Instructor classes
### extends the instructor/student class and as such cannot pull
### the teach/learn methods as they pertain to that specific class only
chris = Instructor.new("Chris")
puts chris.learn
puts chris

cristina = Student.new("Cristina")
puts cristina.teach
puts cristina


