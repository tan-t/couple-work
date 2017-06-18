require 'test_helper'

class AccountTermMstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_term_mst = account_term_msts(:one)
  end

  test "should get index" do
    get account_term_msts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_term_mst_url
    assert_response :success
  end

  test "should create account_term_mst" do
    assert_difference('AccountTermMst.count') do
      post account_term_msts_url, params: { account_term_mst: { closed: @account_term_mst.closed, end_date: @account_term_mst.end_date, month: @account_term_mst.month, start_date: @account_term_mst.start_date, year: @account_term_mst.year } }
    end

    assert_redirected_to account_term_mst_url(AccountTermMst.last)
  end

  test "should show account_term_mst" do
    get account_term_mst_url(@account_term_mst)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_term_mst_url(@account_term_mst)
    assert_response :success
  end

  test "should update account_term_mst" do
    patch account_term_mst_url(@account_term_mst), params: { account_term_mst: { closed: @account_term_mst.closed, end_date: @account_term_mst.end_date, month: @account_term_mst.month, start_date: @account_term_mst.start_date, year: @account_term_mst.year } }
    assert_redirected_to account_term_mst_url(@account_term_mst)
  end

  test "should destroy account_term_mst" do
    assert_difference('AccountTermMst.count', -1) do
      delete account_term_mst_url(@account_term_mst)
    end

    assert_redirected_to account_term_msts_url
  end
end
