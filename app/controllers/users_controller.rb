class UsersController < Clearance::UsersController

  private

  def user_params
    params[:user].permit(:name, :email, :password)
  end
end