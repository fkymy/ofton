class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  validates :name,
            presence: true,
            length: { maximum: 191 }

  validates :slack_id,
            length: { maximum: 191 }
end
