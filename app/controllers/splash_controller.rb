class SplashController < ApplicationController
  def see
    return unless current_user

    redirect_to user_groups_path(current_user)
  end
end
