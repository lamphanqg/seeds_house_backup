# frozen_string_literal: true

class SpeciesController < ApplicationController
  def index
    @page_title = "野菜一覧"
    @species = Species.all
  end
end
