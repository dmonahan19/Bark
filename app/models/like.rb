class Like < ApplicationRecord


  belongs_to :liker,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :User

  belongs_to :dog,
    primary_key: :id,
    foreign_key: :dog_id,
    class_name: :Dog,
    counter_cache: true


end