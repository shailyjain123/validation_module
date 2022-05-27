require './test_class2.rb'
require './test_class.rb'

test = {}
test[:a ] = Test2Class.new("Samantha", 21, "samantha@gmail.com")
test[:a1] = Test2Class.new(nil, 21, "samantha@gmail.com")
test[:a2] = Test2Class.new("Samantha", nil, "samantha@gmail.com")
 
test[:b ] = TestClass.new("Samantha", 21, "sa\\mantha@gmail.com")
test[:b1] = TestClass.new("Samantha28", 21, "samantha@gmail.com")

test[:c ] = TestClass.new("Samantha", 21, 125)
test[:c1] = TestClass.new("Samantha", "21", 125)

puts "Validation of a valid object #{test[:a].valid?.to_s} "
puts "Validation of a invalid object with preesnce #{test[:a1].valid?.to_s}, #{test[:a2].valid?.to_s} "
puts "Validation of a invalid object with format   #{test[:b].valid?.to_s}, #{test[:b1].valid?.to_s} "
puts "Validation of a invalid object with type     #{test[:c].valid?.to_s}, #{test[:c1].valid?.to_s} "

test.each_pair do |k, v|
  begin
    v.validate!
  rescue StandardError => e
    puts e.to_s
  end
end 

begin
  require './test_class3.rb'
  test[:c4] = Test3Class.new("Samantha", "21", 125)
rescue StandardError => e
  puts e.to_s
end

