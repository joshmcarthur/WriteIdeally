require 'spec_helper'

describe User do
  subject do
    FactoryGirl.build(:user)
  end

  it "should be configured for devise" do
    subject.class.included_modules.should include Devise::Models::Authenticatable
  end

  it "should have a virtual attribute defined for login" do
    subject.should respond_to :login
  end

  it { should validate_presence_of(:username) }
  it { should have_many(:projects) }
end
