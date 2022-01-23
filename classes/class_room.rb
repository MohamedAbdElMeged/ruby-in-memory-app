class ClassRoom
    @@classRooms = []
    attr_accessor :id,:name
    def initialize(**arg)
        @id = @@classRooms.count + 1
        @name = arg[:name]
        @@classRooms.push(self)
        puts "ADDED SUCCESSFULY!"
        puts self.class_data
    end
    def self.all_classRooms
        @@classRooms
    end

    def self.get_class(id)
        @@classRooms.find{|h| h.id==id}
    end
    def self.search(**arg)
        send(arg[:by_what] ,arg[:key])
    end
    def self.search_by_id(id)
        @@classRooms.find{|h| h.id.to_s==id}.class_data
    end
    def self.search_by_name(name)
        @@classRooms.find{|h|  h.name.downcase==name}.class_data
    end
    def class_data
        "Id: #{self.id} Name: #{self.name} "
    end
    
    
end
