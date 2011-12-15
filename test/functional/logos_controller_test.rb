require 'test_helper'

class LogosControllerTest < ActionController::TestCase
  test "index returns ten logos" do
    10.times{|i| Logo.create!(:title => i, :json => "{}")}
    get :index
    assert_equal 10, assigns[:logos].size
  end
  
  test "juniper logo is always returned separately" do
    Logo.create!(:title => "Juniper", :json => "{}")
    get :index
    assert_equal "Juniper", assigns[:juniper_logo].title
    assert_equal 0, assigns[:logos].size
  end
end
