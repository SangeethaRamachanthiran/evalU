# frozen_string_literal: true

require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  test 'should get choose' do
    get plays_choose_url
    assert_response :success
  end
end
