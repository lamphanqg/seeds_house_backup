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
end
