class EmailMagazine < ActiveRecord::Base
  has_many :users, through: :subscriptions
  has_many :subscriptions
end
