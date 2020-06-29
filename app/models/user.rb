class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  #Username only allow letters,numbers and underscore
  #validates :username, format: { with: /\A[\w\_]+\z/ }

  validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  before_save do
    self.email.downcase! if self.email
  end
  # extend FriendlyId
  # friendly_id :username, use: [:slugged, :finders]
  
  def remember_me
    true
  end
end
