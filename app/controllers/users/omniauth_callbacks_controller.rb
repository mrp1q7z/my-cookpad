class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    user_data = {
      email: auth.info.email,
      sex: auth.extra.raw_info.gender
    }
    user_data["birth_date"] = Date.strptime(auth.extra.raw_info.birthday,
      '%m/%d/%Y') if auth.extra.raw_info.birthday

    redirect_to new_user_registration_url, flash: { oauth_user: user_data }
  end
end
