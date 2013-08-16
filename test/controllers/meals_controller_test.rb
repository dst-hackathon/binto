require 'test_helper'

class MealsControllerTest < ActionController::TestCase
  setup do
    @meal = meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meal" do
    assert_difference('Meal.count') do
      post :create, meal: { consumer_id: @meal.consumer_id, consumer_name: @meal.consumer_name, dish_id: @meal.dish_id, dish_image_code: @meal.dish_image_code, dish_name: @meal.dish_name, meal_date: @meal.meal_date, restaurant_id: @meal.restaurant_id, restaurant_image_code: @meal.restaurant_image_code, restaurant_name: @meal.restaurant_name }
    end

    assert_redirected_to meal_path(assigns(:meal))
  end

  test "should show meal" do
    get :show, id: @meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meal
    assert_response :success
  end

  test "should update meal" do
    patch :update, id: @meal, meal: { consumer_id: @meal.consumer_id, consumer_name: @meal.consumer_name, dish_id: @meal.dish_id, dish_image_code: @meal.dish_image_code, dish_name: @meal.dish_name, meal_date: @meal.meal_date, restaurant_id: @meal.restaurant_id, restaurant_image_code: @meal.restaurant_image_code, restaurant_name: @meal.restaurant_name }
    assert_redirected_to meal_path(assigns(:meal))
  end

  test "should destroy meal" do
    assert_difference('Meal.count', -1) do
      delete :destroy, id: @meal
    end

    assert_redirected_to meals_path
  end
end
