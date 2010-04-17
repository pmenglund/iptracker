# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class IpAddress < ActiveRecord::Base
  belongs_to :cidr
  
  attr_accessible :name, :comments, :free, :ip_address, :cidr_id
  cattr_reader :per_page
  @@per_page = 32
  
  validates_format_of :ip_address, :with => /\d+\.\d+\.\d+\.\d+/
  validates_presence_of :cidr_id
  validates_uniqueness_of :ip_address, :scope => :cidr_id

  before_save :convert_ip

  protected

  def convert_ip
      octets = self.ip_address.split(".")
      self.ip_hex = octets[0].to_i * 256 * 256 * 256 +
                    octets[1].to_i * 256 * 256 +
                    octets[2].to_i * 256 +
                    octets[3].to_i
  end

end
