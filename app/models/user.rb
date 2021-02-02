class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  has_many :songs, dependent: :destroy



  def self.guest
    find_or_create_by!(email: 'guest@com') do |user|
      user.password = "guest111"
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
