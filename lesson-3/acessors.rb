module Acessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    private

    def history_add(method_name, new_value)
      @history ||= {}
      if @history == {}
        @history.merge!(method_name => [new_value])
      else
        @history[method_name].push(new_value)
      end
    end
  end

  module ClassMethods
    def attr_accessor_with_history(*methods_name)
      methods_name.each do |method_name|
        reader(method_name)
        writer_with_history(method_name)
        define_method("#{method_name}_history") { @history[method_name] }
      end
    end

    def strong_attr_accessor(method_name, type)
      reader(method_name)
      writer_with_strong(method_name, type)
    end

    private

    def reader(method_name)
      inst_variable_name = "@#{method_name}".to_sym
      define_method(method_name) do
        instance_variable_get(inst_variable_name)
      end
    end

    def writer_with_strong(method_name, type)
      inst_variable_name = "@#{method_name}".to_sym
      define_method("#{method_name}=") do |new_value|
        return instance_variable_set(inst_variable_name, new_value) if new_value.class == type

        raise TypeError, "TypeError in writer_new #{method_name}"
      end
    end

    def writer_with_history(method_name)
      inst_variable_name = "@#{method_name}".to_sym
      define_method("#{method_name}=") do |new_value|
        instance_variable_set(inst_variable_name, new_value)
        history_add(method_name, new_value)
      end
    end
  end
end
