module WhoIAM::Structish
  private
  def entity_attribute_pool
    @__entity_attribute_pool ||= {}
  end

  def entity_attribute(*names)
    names.each do |name|
      raise(ArgumentError, "#{name} is reserved by Ruby") if self.respond_to?(name)

      define_singleton_method name do |*value|
        entity_attribute_pool[self.name] ||= {}
        if value.empty?
          entity_attribute_pool[self.name][name]
        else
          if name.to_s.end_with? 's'
            entity_attribute_pool[self.name][name] = value[0]
          else
            entity_attribute_pool[self.name][name] = value.flatten
          end
        end
      end
    end
  end
end
