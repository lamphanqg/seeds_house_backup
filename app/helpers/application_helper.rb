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
end
