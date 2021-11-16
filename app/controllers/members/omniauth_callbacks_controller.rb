class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @member = Member.from_google(**from_google_params)

    if @member.present?
      #sign_out_all_scopes
      sign_in_and_redirect @member, event: :authentication
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      #sign_in_and_redirect member, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_member_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    # new_member_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image,
	  is_admin: (auth.info.email == 'tamucadetwebsite@gmail.com')
    }
  end

  def auth
    @auth ||= Rails.application.env_config['omniauth.auth'] || request.env['omniauth.auth']
  end
end