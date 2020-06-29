class Category < ActiveRecord::Base
    has_many :orders
    validates :amount, presence: true, length: { minimum: 10 }
end
