# frozen_string_literal: true

module ApplicationHelper
  def asset_exists?(subdirectory, filename)
    File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
  end

  def js_exists?(filename)
    asset_exists?("javascripts", "#{filename}.js")
  end

  def scss_exists?(filename)
    asset_exists?("stylesheets", "#{filename}.scss")
  end

  def page_title
    if @page_title.present?
      "#{@page_title} | SEEDS HOUSE"
    else
      "SEEDS HOUSE"
    end
  end

  def login_logout_link
    if user_signed_in?
      link_to("ログアウト", destroy_user_session_path, method: "delete")
    else
      link_to("ログイン", new_user_session_path)
    end
  end

  def dimissible_flash(key, value)
    key = "info" if key == "notice"
    key = "danger" if key == "alert"
    content_tag :div, class: "alert alert-#{key} alert-dismissible fade show", role: "alert" do
      value.html_safe +
      button_tag(type: "button", class: "close", "data-dismiss" => "alert", "aria-label" => "Close") do
        content_tag(:span, "&times;".html_safe, "aria-hidden" => "true")
      end
    end
  end
end
