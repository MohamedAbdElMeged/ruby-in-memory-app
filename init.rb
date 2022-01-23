require_relative "classes/student"
require_relative "classes/class_room"
require_relative "instruction"

Instruction.new(order: "start_app")


while true do
    puts "################################################################"
    puts "Now What do you want?"
    puts "Available Orders [ exit  , search  , insert_new_class_room , insert_new_student]"
    order = gets.chomp
    Instruction.new(order: order)
end

############################
#test data
# c = ClassRoom.new(name: "vds")
# y = ClassRoom.get_class(c.id)
# puts y.inspect