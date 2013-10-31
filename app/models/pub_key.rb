class PubKey < ActiveRecord::Base

  validates :value, uniqueness: true

  belongs_to :user

end