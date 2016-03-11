require 'thor'

module LMT
  class CLI < Thor
    desc "convert FILE_PATH", "install one of the available apps"
    method_option :output, :aliases => 'o', :default => "output.csv"
    def convert(file_path)
      json_obj = JSONParser.new(file_path)
      json_obj.convert_to_csv(options[:output])
    end

    desc "test", "Run some unit and fonctionnal tests"
    def test
      system('ruby test/lmt_test.rb')
    end
  end
end
