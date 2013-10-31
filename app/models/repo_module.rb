class RepoModule < ActiveRecord::Base

  validates :name, uniqueness: { scope: :namespace_id }

  belongs_to :namespace
  belongs_to :user
  belongs_to :user_group
  belongs_to :access_right

end