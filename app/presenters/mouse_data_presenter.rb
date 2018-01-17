class MouseDataPresenter

attr_reader :mouse

  def initialize(mouse)
    @mouse = mouse
  end

  def mouse_is_favorite?(current_user)
    return true if @mouse.users.include?(current_user)
    false
  end

  def display_lab_id
    "Mouse ##{mouse.lab_id}"
  end

  def display_status
    if mouse.status?
      return mouse.status.titleize
    else
      return "N/A"
    end
  end

  def display_group_number
    mouse.group_number
  end

  def display_diet
    mouse.diet.titleize
  end

  def display_color
    mouse.color.titleize
  end

  def display_sex
    mouse.sex.titleize
  end

  def display_ploidy
    mouse.ploidy.titleize
  end

  def display_protein
    if mouse.protein_ug_per_ml?
      return mouse.protein_ug_per_ml
    else
      return "N/A"
    end
  end

  def display_weight
    if mouse.weight_in_grams?
      return mouse.weight_in_grams
    else
      return "N/A"
    end
  end

  def display_brain_temp
    if mouse.harvest_brain_temp?
      return mouse.weight_in_grams
    else
      return "N/A"
    end
  end

  def format_updated_timestamp
    time = mouse.updated_at.localtime
    time.strftime("%m/%d/%Y, %I:%M%P")
  end
end
