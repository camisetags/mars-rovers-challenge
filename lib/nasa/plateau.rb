module Nasa
	class Plateau
		attr_reader :rovers, :x, :y

		def initialize(x, y)
			@x = x
			@y = y
			@rovers = []
		end

		def add_rovers(rover)
			if rover.instance_of? Nasa::Rover
				rover.plateau = self
				@rovers << rover
			else
				raise 'Must be a Nasa::Rover'
			end
		end

		def limits(first, second)
			return first <= @x && second <= @y
		end
	end
end
