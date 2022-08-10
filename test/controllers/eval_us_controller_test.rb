# frozen_string_literal: true

require 'test_helper'

class EvalUsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get eval_us_index_url
    assert_response :success
  end
end
