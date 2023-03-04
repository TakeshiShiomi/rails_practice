require "test_helper"

class AccountsSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Account.count' do
      post accounts_path, params: { account: { name:  "",
                                         email: "account@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'accounts/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  test "valid signup information" do
    get signup_path
    assert_difference 'Account.count', 1 do
      post accounts_path, params: { account: { name:  "hoge",
                                         email: "account@valid.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'accounts/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
