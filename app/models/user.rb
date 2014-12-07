class User < ActiveRecord::Base
  belongs_to :city
  has_many :donations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 # devise :database_authenticatable, :registerable,
 #        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  scope :donations_ranking, ->() {}

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    token = auth.credentials.token
    city_id = auth.extra.raw_info.location.id

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #user.email = auth.info.email
      #user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.city = find_or_create_city_from(city_id, token)
    end
  end

  def self.find_or_create_city_from(city_id, token)
    City.find_or_create_by(original_id: city_id) do |city|
      graph = Koala::Facebook::API.new(token)
      city_object = graph.get_object(city_id, locale: 'en_US')

      city.latitude = city_object['location']['latitude']
      city.longitude = city_object['location']['longitude']
      city.name = city_object['name']
      city.country = city_object['name'].split(',').last.strip()
    end
  end
end
