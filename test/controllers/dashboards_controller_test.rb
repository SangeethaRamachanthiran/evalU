# frozen_string_literal: true

require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get explore' do
    get dashboards_explore_url
    assert_response :success
  end

  test 'should get mylibrary' do
    get dashboards_mylibrary_url
    assert_response :success
  end

  test 'should get report' do
    get dashboards_report_url
    assert_response :success
  end

  test 'should get profile' do
    get dashboards_profile_url
    assert_response :success
  end
end
