require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { man_day_rate: @item.man_day_rate, off_site_man_days: @item.off_site_man_days, onsite_man_days: @item.onsite_man_days, stage: @item.stage, standard_id: @item.standard_id, total_cost: @item.total_cost, year: @item.year } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { man_day_rate: @item.man_day_rate, off_site_man_days: @item.off_site_man_days, onsite_man_days: @item.onsite_man_days, stage: @item.stage, standard_id: @item.standard_id, total_cost: @item.total_cost, year: @item.year } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
