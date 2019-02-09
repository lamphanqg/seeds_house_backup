# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :admin_user?

  private
    def admin_user?
      user_signed_in? && current_user.is_admin?
    end
end
