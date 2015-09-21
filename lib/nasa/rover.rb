require_relative "plateau"

module Nasa

	class Rover
		attr_accessor :plateau;
		attr_reader :x, :y, :direction, :get_rover;

		def initialize(x, y, direction)
			@x = x;
			@y = y;
			@direction = direction;
		end

		def move(position_string)
			position_string.split('').each do |m|
				unless @plateau.limits(@x, @y)
					raise "Outside of plateau limits!" 	
				end
				
				if m === "M"
					change_xy_position();
				else
					turn(m);
				end
			end
		end

		def turn(side)
			if side === "L"
				@direction = case @direction
				    when "N" then "W";
				    when "S" then "E";
				    when "E" then "N";
				    when "W" then "S";
				   	else raise "Wrong direction , correct the file!";
			    end	
			elsif side === "R"
				@direction = case @direction
				    when "N" then "E";
				    when "S" then "W";
				    when "E" then "S";
				    when "W" then "N";
				    else raise "Wrong direction , correct the file!";
			    end	
			end
		end

		def get_rover()
			return "#{@x} #{@y} #{@direction}"
		end

		private

		def change_xy_position()
			case @direction
			when "N" then @y += 1;
			when "E" then @x += 1;
			when "S" then @y -= 1;
			when "W" then @x -= 1;
			end 
		end

	end
end

