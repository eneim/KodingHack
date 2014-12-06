class Disaster < ActiveRecord::Base
  has_many :donations

  scope :ranking_for, ->(id) { joins(:donations).where(original_id: id).group('country').order('sum_amount').sum('amount') }
end
