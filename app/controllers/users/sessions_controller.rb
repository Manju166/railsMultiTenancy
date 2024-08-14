
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :load_org, only: [:new, :create]
  before_action :check_organization, only: :create

  private

  def load_org
    @organizations = Organization.all
  end

  def check_organization
    if params[:user] && params[:user][:organization_id].present?
      user = User.find_by(email: params[:user][:email])
      if user && user.organization_id != params[:user][:organization_id].to_i
        flash[:alert] = "Organization does not match."
        redirect_to new_user_session_path and return
      end
    else
      flash[:alert] = "Organization must be selected."
      redirect_to new_user_session_path and return
    end
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end