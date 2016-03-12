module LMT
  class StructureError < StandardError
  	# Raise when an object is different that the reference one (the first object).
  	#
    # @param [String] msg Correspond to the displayed message when the error is raised.
    # @return [StructureError]
    def initialize(msg = "The structure of the provided JSON objects is irregular.")
      super
    end
  end
end
