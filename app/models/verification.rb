class Verification < ActiveRecord::Base
  belongs_to :ip_address
  attr_accessible :ip_address_id, :lookup, :reverse_lookup, :ping
end
