require_relative "lib/nasa/plateau"
require_relative "lib/nasa/rover"
require_relative "lib/file_reader"

input_file = FileReader.new("inputs.txt");

puts("Input:");
puts(input_file);
puts();


puts("Output:");
plateau = Nasa::Plateau.new(input_file.plateau_size[0], input_file.plateau_size[1]);

rover1 = Nasa::Rover.new(
	input_file.first_rover_position[:x],
	input_file.first_rover_position[:y], 
	input_file.first_rover_position[:direction]
);

rover2 = Nasa::Rover.new(
	input_file.second_rover_position[:x],
	input_file.second_rover_position[:y], 
	input_file.second_rover_position[:direction]
);

plateau.add_rovers(rover1);
plateau.add_rovers(rover2);

rover1.move(input_file.first_rover_movements);
rover2.move(input_file.second_rover_movements);

puts(rover1.get_rover());
puts(rover2.get_rover());