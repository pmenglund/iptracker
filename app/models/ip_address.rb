# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class IpAddress < ActiveRecord::Base
  belongs_to :cidr
  has_one :assignment, :dependent => :destroy
  has_one :host, :through => :assignment
  has_many :verifications, :order => 'created_at DESC', :limit => 2
  has_one :latest_verification, :class_name => 'Verification', :order => 'created_at DESC'
  
  attr_accessible :name, :comments, :free, :ip_address, :cidr_id, :host_id
  cattr_reader :per_page
  @@per_page = 32
  
  validates_format_of :ip_address, :with => /\d+\.\d+\.\d+\.\d+/
  validates_presence_of :cidr_id
  validates_uniqueness_of :ip_address, :scope => :cidr_id

  before_create :convert_ip

  # virtual attribute to set/get host
  def host_id
    host.id if host
  end
  
  # virtual attribute to set/get host
  def host_id=hid
    if assignment
      a = assignment
    else
      a = Assignment.new(:ip_address_id => id)
    end
    a.host_id = hid
    a.save
  end
  
  def display_name
    s = ip_address
    s += " (#{name})" unless name.empty?
    s
  end
  
  # does the IP resolve to the name?
  def reverse_lookup_ok?
    return true unless self.usable?
    return true if self.name.empty?
    reverse_lookup == self.name
  end

  # does the name resolve to the IP?
  def lookup_ok?
    return true unless self.usable?
    return true if self.name.empty?
    lookup == self.ip_address
  end
  
  def ip_up?
    return true unless self.usable?
    ping.nil? ? false : ping
  end
  
  def ping
    #get_latest 'ping'
    latest_verification ? latest_verification.ping : nil
  end
  
  def lookup
    get_latest 'lookup'
  end
  
  def reverse_lookup
    get_latest 'reverse_lookup'
  end

  def verify
    Verification.verify_ip(self)
  end
  
  protected

  def get_latest(v)
    latest_verification ? latest_verification.send(v) : nil
  end
  
  def convert_ip
      octets = self.ip_address.split(".")
      self.ip_hex = octets[0].to_i * 256 * 256 * 256 +
                    octets[1].to_i * 256 * 256 +
                    octets[2].to_i * 256 +
                    octets[3].to_i
  end

end
