require 'json'

module LMT
  class JSONParser
    attr_reader :objects
    
    # Initialize an instance of JSONParser that take a json file path (as a string) in entry, able to extract field names and their value in different i_vars.
    # Keys are converted to a specific syntax (e.g. object.key.field_value).
    #
    # @param [String] path The path of the JSON file we want to keep keys and objects attributes.
    def initialize(path)
      json_file = read_json_file(path)
      parsed_json = parse_json_file(json_file)
      @keys = read_json_obj_structure(parsed_json.first)
      @objects = associate_data_to_keys(parsed_json, @keys)
    end
    
    # Converts, through our CSV convertor, the datas contained in .self instance to a CSV file while filtering them. 
    #
    # @param [String] output_file The (relative or absolute) path of the output file.
    def convert_to_csv(output_file)
      generator = CSVGenerator.new(@keys, @objects)
      generator.generate_csv(output_file)
    end
  
    protected
  
    def read_json_file(json_path)
      @json_file ||= File.read(json_path)
    end
  
    def parse_json_file(json_file)
      @parsed_json ||= JSON.parse(json_file)
    end
  
    def read_json_obj_structure(json_obj, parent = nil, tmp_keys = []) # Reads object structure and keeps its field names
      json_obj.each do |object_key, object_value|
        if object_value.is_a?(Hash)
          read_json_obj_structure(object_value, object_naming(object_key, parent), tmp_keys)
        else
          tmp_keys << object_naming(object_key, parent)
        end
      end
      tmp_keys
    end
  
    def associate_data_to_keys(parsed_json, keys)
      objects = []
      parsed_json.each do |json_object|
        verify_object_structure(json_object, keys)
        object = []
        keys.each do |path|
          object << access_value_in_object_from_path(path, json_object)
        end
        objects << object
      end
      objects
    end
    
    def verify_object_structure(json_object, keys)
      obj_keys = read_json_obj_structure(json_object)
      fail StructureError unless obj_keys == keys
    end

    def object_naming(key, parent)
      parent ? "#{parent}.#{key}" : key.to_s
    end
  
    def access_value_in_object_from_path(path, json_object)
      unless path.include?('.')
        json_object[path]
      else
        points = path.split('.')
        value = json_object
        points.each do |point|
          value = value[point]
        end
        value
      end
    end
  end
end
