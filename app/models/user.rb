# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

class User < ActiveRecord::Base
  acts_as_authentic
end
