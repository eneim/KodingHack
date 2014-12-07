require 'rest_client'

class DisasterUpdater
  def self.update
    auth_token = 'sYmLTrRWcnh2zB3Aqkex'

    10.times do |n|
      url = "http://api.sigimera.org/v1/crises?page=#{n+1}&auth_token=#{auth_token}"
      Rails.logger.info "Fetching... #{url}"

      ActiveSupport::JSON.decode(RestClient.get(url)).each do |r|
        Disaster.find_or_create_from_raw(r)
      end
    end
  end
end
