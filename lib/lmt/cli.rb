require 'thor'

module LMT
  class CLI < Thor
    desc "convert FILE_PATH", "install one of the available apps"
    method_option :output, :aliases => 'o', :default => "output.csv"
    # Do a simple conversion from a JSON file to a CSV file.
    #
    # @param [String] file_path The path of the file to convert.
    def convert(file_path)
      json_obj = JSONParser.new(file_path)
      json_obj.convert_to_csv(options[:output])
    end

    desc "test", "Run some fonctionnal tests"
    # Run all the tests contained in test/lmt_test.rb file. These are fonctionnal tests.
    def test
      system('ruby test/lmt_test.rb')
    end
  end
end
