class Square
	attr_accessor :parent, :child, :position

	def initialize(position, parent, child)	
		@position = position
		@parent = parent
		@child = child	
	end
	
	def to_s
		str = ""
		str += @position.nil? ? "\t@position: Nil\n" : "\t@position: #{@position}\n"
		str += @parent.nil? ? "\t@parent: Nil\n" : "\t@parent: #{@parent.position}\n"
		str += @child.nil? ? "\t@child: Nil\n" : "\t@child: #{@child.position}\n"
		return 	str		
	end

	

	
end
