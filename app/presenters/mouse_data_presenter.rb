class MouseDataPresenter

attr_reader :mouse

  def initialize(mouse)
    @mouse = mouse
  end

  def mouse_is_favorite?(current_user)
    return true if mouse.users.include?(current_user)
    false
  end

  def display_lab_id
    "Mouse ##{mouse.lab_id}"
  end

  def display_harvest_status
    mouse.harvest_status.titleize
  end

  def display_treatment_status
    mouse.treatment_status.titleize
  end

  def display_active_status
    mouse.active_status.titleize
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

  def display_date_of_birth
    mouse.date_of_birth.strftime('%m/%d/%Y')
  end

  def display_experiment_start_date
    mouse.experiment_start_date.strftime('%m/%d/%Y')
  end

  def format_updated_timestamp
      time = mouse.updated_at.localtime
      time.strftime("%m/%d/%Y, at %I:%M%P")
  end

end
