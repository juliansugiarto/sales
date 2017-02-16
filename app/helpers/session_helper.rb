# Session helper
# Included on ApplicationController so method on this
# helper can be accessible on all layer
module SessionHelper

  def current_member
    if session[:user_id].present?
      @current_member ||= User.find(session[:user_id])
      # freeze current member to make it immutable (read only)
      @current_member.freeze
    else
      nil
    end
  end

  def is_logged_in?
    current_member.present?
  end

end
