require './test/test_helper'

class LMTTest < Minitest::Test
  def setup
    @json_datas = LMT::JSONParser.new('assets/users.json')
  end

  def teardown
    # FileUtils.rm_rf(Dir.glob('./test/tmp/*'))
  end

  def test_standard_case
    @json_datas.convert_to_csv('./test/tmp/output.csv')
    generated_file = File.read('./test/tmp/output.csv')
    comp_file = File.read('assets/users_ref.csv')
    assert_equal(generated_file, comp_file)
  end
end
