class User < ActiveRecord::Base
  extend Enumerize
  enumerize :sex, in: { female: 1, male: 2 }

  has_many :recipes
  has_many :email_magazines, through: :subscriptions
  has_many :subscriptions
  has_many :tukurepos

  accepts_nested_attributes_for :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable

  def default_nickname
    if self.nickname.blank?
      'ニックネームを登録してください'
    else
      self.nickname
    end
  end
end
