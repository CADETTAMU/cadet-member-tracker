# frozen_string_literal: true

require 'test_helper'

class AffiliateOrgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @affiliate_org = affiliate_orgs(:one)
  end

  test 'should get index' do
    get affiliate_orgs_url
    assert_response :success
  end

  test 'should get new' do
    get new_affiliate_org_url
    assert_response :success
  end

  test 'should create affiliate_org' do
    assert_difference('AffiliateOrg.count') do
      post affiliate_orgs_url, params: { affiliate_org: { org_desc: @affiliate_org.org_desc, org_link: @affiliate_org.org_link, org_name: @affiliate_org.org_name } }
    end

    assert_redirected_to affiliate_org_url(AffiliateOrg.last)
  end

  test 'should show affiliate_org' do
    get affiliate_org_url(@affiliate_org)
    assert_response :success
  end

  test 'should get edit' do
    get edit_affiliate_org_url(@affiliate_org)
    assert_response :success
  end

  test 'should update affiliate_org' do
    patch affiliate_org_url(@affiliate_org), params: { affiliate_org: { org_desc: @affiliate_org.org_desc, org_link: @affiliate_org.org_link, org_name: @affiliate_org.org_name } }
    assert_redirected_to affiliate_org_url(@affiliate_org)
  end

  test 'should destroy affiliate_org' do
    assert_difference('AffiliateOrg.count', -1) do
      delete affiliate_org_url(@affiliate_org)
    end

    assert_redirected_to affiliate_orgs_url
  end
end
