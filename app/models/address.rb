class Address < ApplicationRecord
  has_many :pick_addresses, dependent: :destroy
end
