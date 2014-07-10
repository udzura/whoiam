class WhoIAM::Group
  extend WhoIAM::Structish
  entity_attribute :group_name, :users, :group_policies

  class << self
    def inherited(subclass)
      WhoIAM::Pool.instance.groups[subclass.name] = subclass
    end
  end
end
