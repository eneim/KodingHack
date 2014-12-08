class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :disaster

  def self.user_ranking
    group(:user).order('sum_amount desc').limit(20).sum(:amount).map do |user, amount|
      {
        name: user.name,
        image: user.image,
        amount: amount,
        url: user.url
      }
    end
  end
end
