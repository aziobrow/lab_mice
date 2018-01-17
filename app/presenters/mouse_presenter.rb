class MousePresenter

  def initialize(query)
    @query = query
  end

  def mice
    service.find_mice.map do |raw_mouse|
      Mouse.find_by(lab_id: raw_mouse[:lab_id])
    end
  end

  def tracked_mice(user)
    mice.select {|mouse| mouse.users.include?(user)}
  end

  private
  attr_reader :query

      def service
        MouseService.new(query)
      end

end
