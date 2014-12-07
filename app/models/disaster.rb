class Disaster < ActiveRecord::Base
  has_many :donations

  scope :ranking_for, ->(id) { joins(:donations).where(original_id: id).group('country').order('sum_amount').sum('amount') }

  def self.find_or_create_from_raw(data)
    find_or_create_by(oritinal_id: data['crisis_eventid']) do |disaster|
      disaster.subject     = data['dc_subject'].first
      disaster.alert_level = data['crisis_alertLevel']
      disaster.latitude    = data['foaf_based_near'][1]
      disaster.longitude   = data['foaf_based_near'][0]
      disaster.desc        = data['dc_description']
      disaster.title       = data['dc_title']
    end
  end
end
