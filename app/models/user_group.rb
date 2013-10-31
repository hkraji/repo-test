class UserGroup < ActiveRecord::Base

  validates :name, uniqueness: true

  has_many :modules
  has_many :namespaces
  has_many :users_user_groups
  has_many :users, :through => :users_user_groups
end