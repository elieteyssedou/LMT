require 'csv'

module LMT
  class CSVGenerator
    # Initialize an instance of CSVGenerator that take an array of field names in entry and an array of fields, able to generate a CSV File.
    # Also filter field values to be valid (e.g. array become "#{array[0]},...,#{array[N]}" where N is array.size).
    #
    # @param [Array] keys An array of string that contains all the field names 
    # @param [Array] objects An array of variables that contains all the field values, can be string, array or whatever. 
    def initialize(keys, objects)
      @keys = keys
      @objects = objects
      filter_objects_values
    end
  
    # Generate a CSV file from the datas contained in .self instance. Must provide an output file name/path.
    #
    # @param [String] output_file A String containing the name of the output_file (existing or not) and his path. (e.g. "tmp/output.csv")
    def generate_csv(output_file)
      CSV.open(output_file, "wb") do |csv|
        csv << @keys
        @objects.each do |object|
          csv << object
        end
      end
    end
  
    protected
  
    def filter_objects_values
      @objects.each do |object|
        object.map! do |field|
          if field.is_a?(Array)
            filtered_value = field.join(',')
            field = filtered_value
          else
            field
          end
        end
      end
    end
  end
end
