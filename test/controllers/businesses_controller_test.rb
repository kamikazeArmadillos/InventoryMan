class BusinessesControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @biz  = businesses(:one)
    sign_in @user
    @user.businesses.push(@biz)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biz)
  end

  test "should get show" do
    get :show, id: @biz
    assert_response :success
    assert_not_nil assigns(:biz)
  end

end
