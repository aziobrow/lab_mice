class MouseDataPresenter

attr_reader :mouse

  def initialize(mouse)
    @mouse = mouse
  end

  def display_status
    @mouse.status.titleize
  end

  def display_diet
    @mouse.diet.titleize
  end

  def display_color
    @mouse.color.titleize
  end

  def display_sex
    @mouse.sex.titleize
  end

  def display_trisomic
    @mouse.trisomic.to_s.titleize
  end

  def display_protein
    if @mouse.protein_ug_per_ml?
      return @mouse.protein_ug_per_ml
    else
      return "N/A"
    end
  end

  def display_weight
    if @mouse.weight_in_grams?
      return @mouse.weight_in_grams
    else
      return "N/A"
    end
  end

  def format_updated_timestamp
    time = @mouse.updated_at.localtime
    time.strftime("%m/%d/%Y, %I:%M%P")
  end
end
