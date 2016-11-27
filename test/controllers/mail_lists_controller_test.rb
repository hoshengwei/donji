require 'test_helper'

class MailListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail_list = mail_lists(:one)
  end

  test "should get index" do
    get mail_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_list_url
    assert_response :success
  end

  test "should create mail_list" do
    assert_difference('MailList.count') do
      post mail_lists_url, params: { mail_list: { address: @mail_list.address } }
    end

    assert_redirected_to mail_list_url(MailList.last)
  end

  test "should show mail_list" do
    get mail_list_url(@mail_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_list_url(@mail_list)
    assert_response :success
  end

  test "should update mail_list" do
    patch mail_list_url(@mail_list), params: { mail_list: { address: @mail_list.address } }
    assert_redirected_to mail_list_url(@mail_list)
  end

  test "should destroy mail_list" do
    assert_difference('MailList.count', -1) do
      delete mail_list_url(@mail_list)
    end

    assert_redirected_to mail_lists_url
  end
end
