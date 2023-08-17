class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates_uniqueness_of :asker_id, :scope => [:receiver_id]
end
