require 'spec_helper'

describe Project do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should_not allow_mass_assignment_of(:name) }

  it { should belong_to(:user) }

  describe "#not_trials" do
    context "subject is trial" do
      subject do
        FactoryGirl.create(:project, :trial => true)
      end

      before do
        subject
      end

      it { Project.not_trials.should_not include subject }
    end

    context "subject is not trial" do
      subject do
        FactoryGirl.create(:project)
      end

      before do
        subject
      end

      it { Project.not_trials.should include subject }
    end
  end
end
