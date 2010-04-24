# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class Host < ActiveRecord::Base
  belongs_to :host_type
  has_many :assignments, :dependent => :destroy
  has_many :ip_addresses, :through => :assignments, :order => 'ip_hex'
  
  validates_presence_of :name, :host_type
  
  attr_accessible :name, :comments, :host_type_id, :eol, :assignments_attributes
  accepts_nested_attributes_for :assignments, :allow_destroy => true,
   :reject_if => lambda {|a| a[:ip_address_id].blank? }
    
end
