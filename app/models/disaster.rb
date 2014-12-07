class Disaster < ActiveRecord::Base
  has_many :donations

  scope :ranking_for, ->(id) { joins(:donations).where(original_id: id).group('country').order('sum_amount').sum('amount') }

  def self.find_or_create_from_raw(data)
    find_or_create_by(original_id: data['crisis_eventid']) do |disaster|
      data.delete 'crisis_relatedGDACSResources'
      disaster.raw = data
      logger.info "creating new disater: #{disaster}"
    end
  end
end
