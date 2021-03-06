require 'spec_helper'

describe 'DSL' do
  def evaluate_dsl
    WhoIAM.evaluate_dsl do
      user 'sample-user' do
        password 'sample'
        policy({
            Version: "2012-10-17",
            Statement: [
              {
                Effect: "Allow",
                NotAction: "iam:*",
                Resource: "*"
              }
            ]
          })
      end

      group 'admin' do
        users %w(sample-user)
        policy({
            Version: "2012-10-17",
            Statement: [
              {
                Effect: "Allow",
                NotAction: "iam:*",
                Resource: "*"
              }
            ]
          })
      end

      role 'sample' do
        policy({
            Version: "2012-10-17",
            Statement: [
              {
                Effect: "Allow",
                NotAction: "iam:*",
                Resource: "*"
              }
            ]
          })

        trust_relationship({
            Version: "2012-10-17",
            Statement: [
              {
                Sid: "",
                Effect: "Allow",
                Principal: {
                  Service: "ec2.amazonaws.com"
                },
                Action: "sts:AssumeRole"
              }
            ]
          })
      end
    end
  end

  describe 'example DSL' do
    it {
      expect {
        evaluate_dsl
      }.not_to raise_error
    }
  end

  describe 'DSL successfully parsed' do
    let(:result) { evaluate_dsl }

    it 'should be parsed and create objects' do
      expect(result.users).to  have_exactly(1).user
      expect(result.groups).to have_exactly(1).group
      expect(result.roles).to  have_exactly(1).role
    end
  end
end
