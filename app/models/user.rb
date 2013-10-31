class User < ActiveRecord::Base

  validates :username, uniqueness: true

  has_many :pub_keys
  has_many :namespaces
  has_many :modules
  has_many :users_user_groups
  has_many :user_groups, :through => :users_user_groups

end