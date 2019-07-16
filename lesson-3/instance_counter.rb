module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def register_instance
      self.class.items ||= []
      self.class.items << self
    end
  end

  module ClassMethods
    attr_accessor :items
  end
end
