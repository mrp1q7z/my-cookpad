class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :email_magazine
end
