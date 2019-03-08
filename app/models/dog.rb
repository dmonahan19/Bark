# == Schema Information
#
# Table name: dogs
#
#  id            :integer          not null, primary key
#  name          :string
#  birthday      :datetime
#  adoption_date :datetime
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer          not null
#

class Dog < ApplicationRecord
   # validates :owner_id, presence: true

  has_many_attached :images

     belongs_to :user,
        foreign_key: :owner_id,
        primary_key: :id,
        class_name: :User,
        optional: true

      has_many :likes,
         primary_key: :id,
         foreign_key: :dog_id,
         class_name: :Like,
         dependent: :destroy

  
      has_many :likers,
         through: :likes,
         class_name: :User


  
end
