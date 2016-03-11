require 'csv'

module LivementorTest
  class CSVGenerator
    def initialize(keys, objects)
      @keys = keys
      @objects = objects
      filter_objects_values
    end
  
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
