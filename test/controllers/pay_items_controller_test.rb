require 'test_helper'

class PayItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_item = pay_items(:one)
  end

  test "should get index" do
    get pay_items_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_item_url
    assert_response :success
  end

  test "should create pay_item" do
    assert_difference('PayItem.count') do
      post pay_items_url, params: { pay_item: { code: @pay_item.code, id: @pay_item.id, name: @pay_item.name } }
    end

    assert_redirected_to pay_item_url(PayItem.last)
  end

  test "should show pay_item" do
    get pay_item_url(@pay_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_item_url(@pay_item)
    assert_response :success
  end

  test "should update pay_item" do
    patch pay_item_url(@pay_item), params: { pay_item: { code: @pay_item.code, id: @pay_item.id, name: @pay_item.name } }
    assert_redirected_to pay_item_url(@pay_item)
  end

  test "should destroy pay_item" do
    assert_difference('PayItem.count', -1) do
      delete pay_item_url(@pay_item)
    end

    assert_redirected_to pay_items_url
  end
end
