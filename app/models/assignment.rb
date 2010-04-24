# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class Assignment < ActiveRecord::Base
  belongs_to :ip_address
  belongs_to :host
  has_one :cidr, :through => :ip_address
  
  attr_accessible :host_id, :ip_address_id

  def cidr_id
    @cidr_id ||= ip_address.cidr.id if ip_address
  end
  
end
