class Order < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    validates :category, presence: true
    STATUSES = { boss_approved: 1, 
                boss_disapproved: 0, 
                financial_approved: 3, 
                financial_disapproved: 2 }.freeze
    enum status: STATUSES
  
    scope :boss_approved, -> { where(status: 'boss_approved') }
    scope :boss_disapproved, -> { where(status: 'boss_disapproved') }
    scope :financial_approved, -> { where(status: 'financial_approved') }
    scope :financial_disapproved, -> { where(status: 'financial_disapproved') }
end
