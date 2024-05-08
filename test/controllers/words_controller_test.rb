require "test_helper"

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get random_word" do
    get words_random_word_url
    assert_response :success
  end
end
