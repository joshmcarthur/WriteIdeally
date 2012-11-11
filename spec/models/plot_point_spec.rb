require 'spec_helper'

describe PlotPoint do
  it { should belong_to(:project) }
  it { should have_one(:user) }
  it { should have_many(:sections) }

  it { should validate_presence_of(:title) }
end
