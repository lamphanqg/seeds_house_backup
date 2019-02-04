# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    redirect_to root_path unless (user_signed_in? && current_user.is_admin?)
  end
end
