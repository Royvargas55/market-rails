class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one_attached :avatar
  ROLES = { boss_approved: 1, 
    boss_disapproved: 0, 
    financial_approved: 3, 
    financial_disapproved: 2 }.freeze
  enum roles: ROLES

  scope :boss_approved, -> { where(status: 'boss_approved') }
  scope :boss_disapproved, -> { where(status: 'boss_disapproved') }
  scope :financial_approved, -> { where(status: 'financial_approved') }
  scope :financial_disapproved, -> { where(status: 'financial_disapproved') }
  #Username only allow letters,numbers and underscore
  #validates :username, format: { with: /\A[\w\_]+\z/ }

  validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  before_create :default_username
  before_save do
    self.email.downcase! if self.email
  end
  # extend FriendlyId
  # friendly_id :username, use: [:slugged, :finders]
  
  def remember_me
    true
  end
  def default_username
    self.username ||= "u/#{email.split("@")[0]}"
 end
end
