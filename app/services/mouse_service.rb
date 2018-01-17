class MouseService
  attr_reader :conn, :filter

  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_mice
    response = conn.get do |req|
      req.url "/api/v1/mice/find"
      req.params["diet"] = "#{filter[:diet]}"
      req.params["ploidy"] = "#{filter[:ploidy]}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
