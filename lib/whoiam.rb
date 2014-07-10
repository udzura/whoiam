require "whoiam/version"

module WhoIAM
  autoload :Pool,   'whoiam/pool'
  autoload :Client, 'whoiam/client'

  autoload :Structish, 'whoiam/structish'
  autoload :User,   'whoiam/user'
  autoload :Group,  'whoiam/group'
  autoload :Policy, 'whoiam/policy'
  autoload :Role,   'whoiam/role'
end
