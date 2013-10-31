class Namespace < ActiveRecord::Base

  validates :name, uniqueness: true

  belongs_to :access_right
  belongs_to :user_group
  belongs_to :user
  has_many   :modules

end