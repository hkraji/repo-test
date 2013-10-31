require 'utils/md5'

class AccessRight < ActiveRecord::Base

  include MD5

  validates :checksum, uniqueness: true

  serialize :permission_hash, Hash

  has_many :namespaces
  has_many :modules

  before_validation :calculate_checksum

  private

  def calculate_checksum
    if self.permission_hash
      self.checksum = createsig(self.permission_hash)
    end
  end



end