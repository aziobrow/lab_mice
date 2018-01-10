class MousePresenter

  def initialize(query)
    @query = query
  end

  def mice
    service.find_mice.map do |raw_mouse|
      Mouse.find_by(original_id: raw_mouse[:original_id])
    end
  end

  private
  attr_reader :query

      def service
        MouseService.new(query)
      end

end
