class Base

  def initialize(attrs)
    attrs.each do |k,v|
      singleton_class.class_eval { attr_accessor "#{k}" }
      instance_variable_set "@#{k.to_sym}", v
    end
  end

  def attributes
    return self.class.default_attributes unless defined?(@id)
    hash = {}
    self.instance_variables.each do |v|
      hash[v.to_s.gsub('@', '').to_sym] = instance_variable_get(v)
    end
    hash
  end

  def last
    eval("Mattermost::#{self.class}").all.last
  end

  def first
    eval("Mattermost::#{self.class}").all.first
  end

  def to_json
    attributes.to_json
  end

end

require_relative 'team'
require_relative 'user'
require_relative 'channel'
require_relative 'post'