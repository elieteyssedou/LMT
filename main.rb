#!/usr/bin/ruby
require 'json'
require 'csv'


class JSONParser
  attr_reader :keys

  def initialize(path)
    json_file = read_json_file(path)
    parsed_json = parse_json_file(json_file)
    keys = read_json_obj_structure(parsed_json.first)
    associate_data_to_keys(keys)
  end

  def associate_data_to_keys(keys)
    
  end

  # def convert_to_csv
  #   CSVGenerator.new()
  # end

  protected

  def read_json_file(json_path)
    @json_file ||= File.read(json_path)
  end

  def parse_json_file(json_file)
    @parsed_json ||= JSON.parse(json_file)
  end

  def read_json_obj_structure(json_obj, parent = nil) # Reads object structure and keeps its field names
    @keys ||= []
    json_obj.each do |object_key, object_value|
      if object_value.is_a?(Hash)
        read_json_obj_structure(object_value, object_naming(object_key, parent))
      else
        @keys << object_naming(object_key, parent)
      end
    end
    @keys
  end

  def object_naming(key, parent)
    parent ? "#{parent}.#{key}" : key.to_s
  end
end

# class CSVGenerator

# end

json_obj = JSONParser.new('users.json')
# p json_obj.keys
