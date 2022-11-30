# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :set_countries, only: [:new, :create]

  # GET /resource/sign_in
  def new
    @byebug
    super
  end

  # POST /resource/sign_in
  def create
    @byebug
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def after_sign_in_path_for(resource)
    main_home_path
  end

  private
  def set_countries
    @countries = Country.all
  end
end
