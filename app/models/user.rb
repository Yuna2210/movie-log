class User < ApplicationRecord
  has_one :profile
  has_many :works
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def display_name
    if profile.nil?
      "Unknown"
    else
      profile.nickname.present? ? profile.nickname : profile.first_name
      # if profile.nickname.present?
      #   profile.nickname
      # else
      #   profile.first_name
      # end
    end
  end
end
