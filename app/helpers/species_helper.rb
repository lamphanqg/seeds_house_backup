# frozen_string_literal: true

module SpeciesHelper
  def season_select(name)
    options = [["選択"]]
    (1..12).each do |month|
      options << ["#{month}月上旬", month * 3 - 2]
      options << ["#{month}月中旬", month * 3 - 1]
      options << ["#{month}月下旬", month * 3]
    end
    select_tag(name, options_for_select(options, nil), class: "form-control form-control-sm")
  end

  def add_species_link
    return if !admin_user?
    link_to "追加", admin_species_new_path, class: "btn btn-primary"
  end

  def species_list_item(species)
    link_to(admin_species_edit_path(species.id), class: "list-group-item list-group-item-action") do
      content_tag(:h5, species.name) +
      content_tag(:p, species.family)
    end
  end
end
