class ProfilesController < ApplicationController
  def show
    @review = Review.new
    @user = User.find(params[:id])
    @reviews = Review.where(account_tenant_id: @user)
    authorize @user
  end

  def edit
    @id = params[:id]
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    user = User.find(params[:id])
    authorize user
    strong_user[:id] = params[:id]
    user.update(strong_user)
    redirect_to profile_path(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to platforms_path
  end

  private

  def strong_user
    params.require(:person).permit(:first_name, :last_name, :country, :photo)
  end
end
