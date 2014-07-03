
require 'csv'

def print_header
	puts "Student Directory of Makers Academy"
end

def list_of_students
	@students ||= []
end

def student(name, cohort)
	{name: name, cohort: cohort}
end

def save_a_student(student)
	list_of_students << student
end

def show_list(list_of_students)
	list_of_students.each do |student| 
	puts "#{student[:name]}, #{student[:cohort]}"
	end	
end

def hash_to_array(student)
	student.values
	
end

def save_a_file
	CSV.open("../files/directory.csv","wb") do|csv|
		list_of_students.each{|student| csv << hash_to_array(student)}
	end
end

def load_a_file
	CSV.foreach("../files/directory.csv") do |row|
		save_a_student(student(row[0],row[1]))		

	end

end

def ask_for_input	
	gets.chomp
end

def ask_for_name
	puts "Input student's name:"

end
def ask_for_cohort
	puts "Input student's cohort:"
end

def display_interactive_menu
	puts "1.-Add a student\n2.-Show a list of a students\n3.-Save a file\n4.-Load a file\n9.-Exit"
end

def interactive_menu
	display_interactive_menu
	case (ask_for_input)
		when "1" 
			save_a_student(student(ask_for_input,ask_for_input))
		when "2" 
			show_list(list_of_students)
		when "3" 
			save_a_file
		when "4" 
			load_a_file
		when "9"
			exit
		else
			puts "try again"

	end
end

def loop_the_menu
	loop do
		interactive_menu	
	end
end

