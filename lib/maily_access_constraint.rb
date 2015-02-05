class MailyAccessConstraint
  def matches?(request)
    # Add here your access rules for Maily Web UI. Ie:
    #
    #   return false unless request.session[:user_id]
    #   user = User.find request.session[:user_id]
    #   return user && user.admin?

    true
  end
end
