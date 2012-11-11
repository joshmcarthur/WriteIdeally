require 'spec_helper'

describe Section do
  it { should_not allow_mass_assignment_of(:title) }
  it { should_not allow_mass_assignment_of(:content) }
  it { should belong_to(:plot_point) }
end
