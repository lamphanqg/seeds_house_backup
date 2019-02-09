# frozen_string_literal: true

class Admin::SpeciesController < AdminController
  def new
    @page_title = "種追加"
  end

  def create
    species = Species.new
    species.name = params[:name]
    species.family = params[:family]

    plant_season = PlantSeason.new
    plant_season.sow_months_start       = params[:sow_months_start]
    plant_season.sow_months_end         = params[:sow_months_end]
    plant_season.plant_months_start     = params[:plant_months_start]
    plant_season.plant_months_end       = params[:plant_months_end]
    plant_season.harvest_months_start   = params[:harvest_months_start]
    plant_season.harvest_months_end     = params[:harvest_months_end]

    species.plant_seasons << plant_season

    respond_to do |format|
      if species.save
        format.html { redirect_to({ controller: "/species", action: "index" }, { flash: { success: "成功しました。" } }) }
      else

      end
    end
  end
end
