# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    redirect_to root_path unless admin_user?
  end
end
