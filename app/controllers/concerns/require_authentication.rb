module RequireAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated_user
  end

  def ensure_authenticated_user
    if (user = User.find_by_valid_session(session))
      Current.user = user
    else
      redirect_to new_user_session_path
    end
  end
end
