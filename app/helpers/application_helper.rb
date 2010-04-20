# Copyright 2010 Code Nursery AB. All rights reserved.
# Use is subject to license terms.

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def yes_no(bool)
    bool ? "yes" : "no"
  end
  
  def up_down(bool)
    case
    when bool.nil?
      "-"
    when true
      "yes"
    when false
      "no"
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
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize, :f => builder) #  + "_fields"
    end
    link_to_function(name,h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
