class User < ApplicationRecord
  # global settings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]
  
  # アソシエーション
  has_many :sns
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :completions, dependent: :destroy

  # authenticates_with_sorcery! do |config|
  #   config.authentications_class = Authentication
  # end

  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :profile, length: { maximum: 200 }

  enum role: { user: 0, admin: 200 }

  mount_uploader :image, ImageUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.name = "ゲスト"
      user.password = "123456789"
      user.password_confirmation = "123456789"
    end
  end

  def self.order_by_reviews
    User.select('users.*', 'count(reviews.id) AS reviews').left_joins(:reviews).group('users.id').order('reviews DESC')
  end

  def self.order_by_completions
    User.select('users.*', 'count(completions.id) AS completions').left_joins(:completions).group('users.id').order('completions DESC')
  end
  
# global settings

end
