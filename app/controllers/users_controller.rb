class UsersController < ApplicationController
  def shopping_list
    return unless current_user

    @foods_list = current_user.missing_foods_qt
    @total_price = 0
    @foods_list.each { |food, qt| @total_price += food.price * qt }
  end
end
