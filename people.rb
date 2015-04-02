class	Person
	attr_writer :name
	def initialize(name)
		@name = name
	end
end	

class Student
	def learn
		puts "I get it!"
	end
end

class Instructor
	def teach
		puts "Everything in Ruby is an object!"
	end
end

student = Student.new
teacher = Instructor.new
puts student.learn
puts teacher.teach 
