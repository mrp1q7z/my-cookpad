class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    @user = User.new
    if flash[:oauth_user]
      auth = flash["oauth_user"]
      @user.email = auth["email"]
      @user.sex = auth["sex"]
      @user.birth_date = auth["birth_date"]
    end
  end

  def edit
    EmailMagazine.all.each do |m|
      @user.email_magazines << m unless @user.email_magazines.exists?(m)
    end
    Rails.logger.debug(@user.subscriptions.inspect)
    super
  end

  protected

  def configure_permitted_parameters
    keys = [:nickname, :sex, :birth_date, :zip_code, subscriptions_attributes: [:accept, :id]]
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.for(action) << keys
    end
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
