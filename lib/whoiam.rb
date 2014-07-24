require "whoiam/version"

module WhoIAM
  autoload :Client, 'whoiam/client'

  autoload :DSLEvaluator, 'whoiam/dsl_evaluator'
  autoload :User,   'whoiam/user'
  autoload :Group,  'whoiam/group'
  autoload :Policy, 'whoiam/policy'
  autoload :Role,   'whoiam/role'

  class << self
    def evaluate_dsl(&block)
      result = DSLEvaluator.new(&block)
      return result
    end
  end
end
