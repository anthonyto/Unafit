class Manager < ActiveRecord::Base
  # This sets up the polymorphic association 
  # meta is the reference key
  has_one :user, as: :meta, dependent: :destroy
  accepts_nested_attributes_for :user
end
