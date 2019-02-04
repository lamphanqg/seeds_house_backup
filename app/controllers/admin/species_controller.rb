# frozen_string_literal: true

class Admin::SpeciesController < AdminController
  def index
    @page_title = "野菜一覧"
    @species = Species.all
  end

  def new
    @page_title = "種追加"
  end

  def create

  end
end
