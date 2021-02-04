class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def new
    # @profile = Profile.new(user_id: current_user.id)
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save
    if @profile.save
      redirect_to profile_path, notice: "You are successful to register your profile!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Your profile has been updated!"
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :nickname,
      :gender,
      :introducer,
      :image,
      :remove_image,
      :image_cache
    )
  end

end
