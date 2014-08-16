require 'directory'
	

	describe'my student directory do' do

		context "have this features" 
			it "have a header" do
				expect(self).to receive(:puts).with("Student Directory of Makers Academy")  
				print_header
			end
			it "has an empty list of students" do
				expect(list_of_students).to eq []
			end

			it "saves a student into an hash in this form" do
				name,cohort = "Jean",:June
				expect(student(name,cohort)).to eq({name: name,cohort: cohort})
			end

			it "stores a student in the list of students" do
						#This way you can load a student and compare your snapshop
				name,cohort = "Jean",:June
				save_a_student(student(name,cohort))
				expect(list_of_students).to eq([{name: name,cohort: cohort}])

			end
			it "shows a list of students" do
				name,cohort = "Jean",:June
				save_a_student(student(name,cohort))
				expect(self).to receive(:puts).with("Jean, June")
				show_list(list_of_students)
				
			end
			

			it "arrays to be saved in CSV" do
				name,cohort = "Jean",:June
				expect(hash_to_array(student(name,cohort))).to eq(["Jean",:June])
				end
			

			it "saves a list on a file" do
				
				save_a_student({name: "Jean", cohort: "June"})
				csv = double :file
				expect(CSV).to receive(:open).with("../files/directory.csv","wb").and_yield(csv)
				expect(csv).to receive(:<<).with(["Jean","June"])
				save_a_file

			end

			it "loads a list on a file" do
				row = double :file
				expect(CSV).to receive(:foreach).with("../files/directory.csv").and_yield(row)
				expect(row).to receive(:[]).with(0)
				expect(row).to receive(:[]).with(1)
				load_a_file
			end

			it "takes inputs from users" do
				name="Jean"
				expect(self).to receive(:gets).and_return(name+"\n")
				expect(ask_for_input).to eq("Jean")

			end

			
			it "ask for student name" do
			 	expect(self).to receive(:puts).with("Input student's name:")
			 	ask_for_name
			end

			it "ask for student cohort" do
			 	expect(self).to receive(:puts).with("Input student's cohort:")
			 	ask_for_cohort
			end
	
		context "has an interactive menu"
	
			it "has a header" do
				expect(self).to receive(:puts).with("1.-Add a student\n2.-Show a list of a students\n3.-Save a file\n4.-Load a file\n9.-Exit")
				display_interactive_menu
			end

			it "has access to add a student" do
				expect(self).to receive(:display_interactive_menu)
				expect(self).to receive(:ask_for_input).and_return("1")
				expect(self).to receive(:ask_for_input)
				expect(self).to receive(:ask_for_input)
				expect(self).to receive(:save_a_student)
				interactive_menu
			end

			it "can show a list of students" do
				expect(self).to receive(:ask_for_input).and_return("2")
				expect(self).to receive(:show_list)
				interactive_menu
			end
			it "can save a list of students" do
				expect(self).to receive(:ask_for_input).and_return("3")
				expect(self).to receive(:save_a_file)
				interactive_menu
			end
			it "can load a list of students" do
				expect(self).to receive(:ask_for_input).and_return("4")
				expect(self).to receive(:load_a_file)
				interactive_menu
			end
			it "exit the program" do
				expect(self).to receive(:ask_for_input).and_return("9")
				expect(self).to receive(:exit)
				interactive_menu
			end

			
		
	end
