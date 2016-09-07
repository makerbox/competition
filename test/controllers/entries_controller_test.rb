require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { address_line_1: @entry.address_line_1, address_line_2: @entry.address_line_2, birth_year: @entry.birth_year, email: @entry.email, full_name: @entry.full_name, phone: @entry.phone, postcode: @entry.postcode, receipt_number: @entry.receipt_number, sale_date: @entry.sale_date, sale_time: @entry.sale_time, store_name: @entry.store_name, subscribe: @entry.subscribe, terminal_number: @entry.terminal_number } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test "should show entry" do
    get entry_url(@entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { address_line_1: @entry.address_line_1, address_line_2: @entry.address_line_2, birth_year: @entry.birth_year, email: @entry.email, full_name: @entry.full_name, phone: @entry.phone, postcode: @entry.postcode, receipt_number: @entry.receipt_number, sale_date: @entry.sale_date, sale_time: @entry.sale_time, store_name: @entry.store_name, subscribe: @entry.subscribe, terminal_number: @entry.terminal_number } }
    assert_redirected_to entry_url(@entry)
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
