# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins pages' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens bulletin page' do
    bulletin = bulletins(:bulletin3)
    get bulletin_url(bulletin)
    assert_response :success
    assert_select 'h1', 'Bulletin'
    assert_select 'h4', 'Title 3'
    assert_select 'p', 'Body 3'
  end
end
