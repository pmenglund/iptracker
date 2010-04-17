# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class Cidr < ActiveRecord::Base
  has_many :ip_addresses, :dependent => :destroy, :order => 'ip_hex'
  has_many :free_ips, :class_name => "IpAddress", :conditions => {:free => true, :usable => true}, :order => 'ip_hex'

  attr_accessible :cidr, :name, :comments, :proxy, :position
  
  validates_presence_of :name
  validates_format_of :cidr, :with => /\d+\.\d+\.\d+\.\d+\/\d+/, :message => "isn't of the format x.x.x.x/x"

  after_create :generate_ips
  
  def validate
    begin
      NetAddr::CIDR.create(self.cidr) unless self.cidr.empty?
    rescue NetAddr::ValidationError => e
      errors.add(:cidr, e.message)
    end
  end
  
  def generate_ips
      c = NetAddr::CIDR.create(self.cidr)
      c.enumerate.each do |ip|
          i = IpAddress.new(:ip_address => ip, :cidr_id => self.id)
          if ip == c.first
              i.usable = false
              i.free = false
              i.name = "network"
          elsif ip == c.last
              i.usable = false
              i.free = false
              i.name = "broadcast"
          end
          i.save!
      end
  end

  def verify
    puts "verify"
    # nmap -sP -oG /path/to/output cidr
    # verifications.create(:lookup => 'test.foo.com', :reverse_lookup => "1.2.3.4", :ping => true)
  end

end
