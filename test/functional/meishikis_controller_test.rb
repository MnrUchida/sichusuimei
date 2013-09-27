require 'test_helper'

class MeishikisControllerTest < ActionController::TestCase
  setup do
    @meishiki = meishikis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meishiki" do
    assert_difference('Meishiki.count') do
      post :create, meishiki: { day: @meishiki.day, month: @meishiki.month, name: @meishiki.name, sex: @meishiki.sex, time: @meishiki.time, year: @meishiki.year }
    end

    assert_redirected_to meishiki_path(assigns(:meishiki))
  end

  test "should show meishiki" do
    get :show, id: @meishiki
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meishiki
    assert_response :success
  end

  test "should update meishiki" do
    put :update, id: @meishiki, meishiki: { day: @meishiki.day, month: @meishiki.month, name: @meishiki.name, sex: @meishiki.sex, time: @meishiki.time, year: @meishiki.year }
    assert_redirected_to meishiki_path(assigns(:meishiki))
  end

  test "should destroy meishiki" do
    assert_difference('Meishiki.count', -1) do
      delete :destroy, id: @meishiki
    end

    assert_redirected_to people_path
  end
end
