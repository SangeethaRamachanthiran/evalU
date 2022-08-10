# frozen_string_literal: true

require 'test_helper'

class CreatesControllerTest < ActionDispatch::IntegrationTest
  test 'should get quiz' do
    get creates_quiz_url
    assert_response :success
  end
end
