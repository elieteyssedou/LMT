#!/usr/bin/ruby
require 'json'
require 'csv'


class JSONParser
  attr_reader :objects

  def initialize(path)
    json_file = read_json_file(path)
    parsed_json = parse_json_file(json_file)
    @keys = read_json_obj_structure(parsed_json.first)
    @objects = associate_data_to_keys(parsed_json, @keys)
  end

  def convert_to_csv
    generator = CSVGenerator.new(@keys, @objects)
    generator.generate_csv
  end

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

  def associate_data_to_keys(parsed_json, keys)
    objects = []
    parsed_json.each do |json_object|
      object = []
      keys.each do |path|
        object << access_value_in_object_from_path(path, json_object)
      end
      objects << object
    end
    objects
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

class CSVGenerator
  def initialize(keys, objects)
    @keys = keys
    @objects = objects
    filter_objects_values
  end

  def generate_csv
    CSV.open("users.csv", "wb") do |csv|
      csv << @keys
      @objects.each do |object|
        csv << object
        # p object
      end
    end
  end

  protected

  def filter_objects_values
    @objects.each do |object|
      object.map! do |field|
        if field.is_a?(Array)
          filtered_value = field.join(',')
          # filtered_value = "#{filtered_value}"
          field = filtered_value
        else
          field
        end
      end
    end
  end
end

json_obj = JSONParser.new('users.json')
json_obj.convert_to_csv
