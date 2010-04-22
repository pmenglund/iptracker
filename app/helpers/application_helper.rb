# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def yes_no(bool)
    case
    when bool.nil?
      "-"
    when bool
      "yes"
    else
      "no"
    end
  end
  
  def up_down(bool)
    case
    when bool.nil?
      "-"
    when bool
      "up"
    else
      "down"
    end
  end
  
  def display_name(flag, name)
    s = ""
    s += '<span style="color: red;">' unless flag
    if name
      s += h(name)
    else
      s += '-'
    end
    s += '</span>' unless flag
    s
  end

  def link_to_host(ip_address)
    if ip_address.host
      link_to h(ip_address.host.name), ip_address.host
    else
      ""
    end
  end
end
