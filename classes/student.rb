class Student
    @@students = []
    attr_accessor :id , :name,:address,:phone,:class_room_id
    def initialize(**arg)
        @name = arg[:name]
        @address = arg[:address]
        @phone = arg[:phone]
        @class_room_id = arg[:class_room_id]
        if self.validate_student 
            @id = @@students.count + 1
            @@students.push(self)
            puts "ADDED SUCCESSFULY!"
            puts self.student_data
        else
            puts "NOT VALID STUDENT!"
            false
        end

    end
    def validate_student
        self.phone =~ /[0-9]/ && self.phone !=~ /[a-zA-Z]/ && !self.name.empty? && !self.address.empty?  
    end
    
    def self.all_students
        @@students
    end
    def self.search(**arg)
        send(arg[:by_what],arg[:key])
    end
    def student_data
        "Id: #{self.id} Name: #{self.name} Phone: #{self.phone} Address: #{self.address}"
    end
    def self.search_by_id(id)
        @@students.find{|h| h.id.to_s ==id}.student_data
    end
    def self.search_by_name(name)
        @@students.find{|h| h.name.downcase ==name}.student_data
    end
    def self.search_by_phone(phone)
        @@students.find{|h| h.phone ==phone}.student_data
    end
    def self.search_by_address(address)
        @@students.find{|h| h.address.downcase ==arg[:address]}.student_data
    end
    

    
end

# Start Project with init file can see two classes Student & ClassRoom
# Student have (name , age , address , phone , class_room_id )
#   class_room_id: Should Related ClassRoom id and that must be related id from ClassRoom
# and I can Call by method in @student.get_class_room call ClassRoom