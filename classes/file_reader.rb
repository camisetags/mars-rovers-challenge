
class FileReader
	attr_reader :plateau_size, :first_rover_position, :first_rover_movements, 
				:second_rover_position, :second_rover_movements

	def initialize(file_name)
		lines = File.readlines(file_name).map;
		@plateau_size = lines.next;
		@first_rover_position = lines.next;
		@first_rover_movements = lines.next;
		@second_rover_position = lines.next;
		@second_rover_movements = lines.next;
	end

	def plateau_size()
		return @plateau_size.split(' ').map(&:to_i);
	end

	def first_rover_position()
		coordinates = @first_rover_position.split.map();
		return {
			x: coordinates.next.to_i,
			y: coordinates.next.to_i,
			direction: coordinates.next
		}
	end

	def second_rover_position()
		coordinates = @second_rover_position.split.map();
		return {
			x: coordinates.next.to_i,
			y: coordinates.next.to_i,
			direction: coordinates.next
		}
	end

	def to_s()
		return "#{@plateau_size}"+
				"#{@first_rover_position}"+
				"#{@first_rover_movements}"+
				"#{@second_rover_position}"+
				"#{@second_rover_movements}"
	end

end