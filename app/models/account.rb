class Account < ApplicationRecord
  belongs_to :customer
  has_many :withdrawals
  has_many :deposits
  has_many :transfers

end
