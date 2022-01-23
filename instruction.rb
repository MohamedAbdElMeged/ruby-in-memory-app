class Instruction
    def initialize(**arg)
        send(arg[:order])
    end
    def exit
        abort("Good Bye!")
    end
    def search
        puts "################################################################"
        puts "What Do You want To Search For?"
        puts "[Student - Class]"
        search_class = gets.chomp.downcase
        if search_class == "student"
            puts "You Can Search With Id , Name , Phone , Address"
            search_by = gets.chomp.downcase
            puts "Now You Can Search With #{search_by}"
            search_input = gets.chomp.downcase
            search_by = "search_by_" + search_by

            puts Student.search(by_what: search_by , key: search_input)
        else
            puts "You Can Search With Id , Name "
            search_by = gets.chomp.downcase
            puts "Now You Can Search With #{search_by}"
            search_input = gets.chomp.downcase
            search_by = "search_by_" + search_by
            puts ClassRoom.search(by_what:search_by,key:search_input)
        end

    end
    def insert_new_class_room
        puts "################################################################"
        puts "Enter your new class's name"
        name = gets.chomp
        classRoom = ClassRoom.new(name: name)
        puts "################################################################"
        puts "what's count students in that class room?"
        number_of_students = gets.chomp.to_i
        if number_of_students != 0
            number_of_students.times {|student|
                new_student = insert_new_student(classRoom.id)
                redo if !new_student.id
            }
        end
    end
    def insert_new_student(class_room_id=nil)
        if !class_room_id 
            puts "Enter class room id"
            class_room_id = gets.chomp.to_i
        end
        puts "################################################################"
        puts "Enter student's name"
        student_name = gets.chomp
        puts "Enter  student's phone"
        student_phone = gets.chomp
        puts "Enter  student's address"
        student_address = gets.chomp
        new_student = Student.new(name:student_name, phone:student_phone,address: student_address,class_room_id: class_room_id )
    end
    
    
    def start_app
        puts "################################################################"
        puts "Wellcome in School System Please Add how many your Classes Room"
        number_of_classes = gets.chomp.to_i
        if number_of_classes != 0
            number_of_classes.times { |classRoom|
                send("insert_new_class_room")
            }
        end
    end
    
    
    
end