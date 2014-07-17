require 'spec_helper'

describe 'DSL' do
  describe 'example DSL' do
    it {
      expect {
        evaluate_dsl <<-DSL
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
        DSL
      }.not_to raise_error
    }
  end
end
