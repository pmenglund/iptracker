class Assignment < ActiveRecord::Base
  belongs_to :ip_address
  belongs_to :host
  
  attr_accessible :host_id, :ip_address_id
end
