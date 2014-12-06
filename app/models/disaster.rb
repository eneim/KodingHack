class Disaster < ActiveRecord::Base
  has_many :donations

  scope :donations_ranking_for, ->(id) { joins(:donations).where(id: id).group('country').order('sum_amount').sum('amount') }
end
