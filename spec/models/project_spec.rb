require 'spec_helper'

describe Project do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should_not allow_mass_assignment_of(:name) }
end
