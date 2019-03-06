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
#

class Dog < ApplicationRecord
  has_many_attached :images

     belongs_to :user,
        foreign_key: :owner_id,
        primary_key: :id,
        class_name: :User


  
end
