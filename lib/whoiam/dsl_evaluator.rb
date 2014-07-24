class WhoIAM::DSLEvaluator
  def initialize(&block)
    instance_eval(&block)
  end
  attr_accessor :users, :groupes, :roles

  def user name, &b
    user = WhoIAM::User.from_hash(DSL2Hash.parse(&b).merge(user_name: name))
    self.users ||= []
    self.users << user
  end

  def group name, &b
  end

  def role name, &b
  end

  module DSL2Hash
    class << self
      def parse(&dsl)
        @container = {}
        instance_eval(&dsl)
        @container
      end

      def method_missing(attr_name, value)
        @container[attr_name] ||= []
        @container[attr_name] << value
      end
    end
  end
end
