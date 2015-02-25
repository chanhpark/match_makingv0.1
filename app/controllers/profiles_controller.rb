class ProfilesController < ApplicationController

  def index
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile != nil
    else
      redirect_to new_profile_path
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profiles_path
    else
      render "new"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :birthday, :zip_code)
  end

end
