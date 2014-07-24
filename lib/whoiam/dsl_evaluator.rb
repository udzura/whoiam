class WhoIAM::DSLEvaluator
  def initialize(&block)
    instance_eval(&block)
  end

  def user name, &b
  end

  def group name, &b
  end

  def role name, &b
  end
end
