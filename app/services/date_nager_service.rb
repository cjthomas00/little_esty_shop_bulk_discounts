require 'httparty'

class DateNagerService
  def self.get_holidays
    get_url("https://date.nager.at/api/v2/NextPublicHolidays/US")
  end

  def self.get_url(url)
    response = HTTParty.get(url)
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end