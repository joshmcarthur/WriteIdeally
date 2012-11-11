require 'spec_helper'

describe Project do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should_not allow_mass_assignment_of(:name) }

  it { should belong_to(:user) }

  describe "#set_name_from_params_or_default" do
    context "name is passed in" do
      subject do
        p = Project.new
        p.set_name_from_params_or_default({name: 'Test Name'})
        p
      end

      it { subject.name.should eq 'Test Name' }
    end

    context "name is not passed in" do
      subject do
        p = Project.new
        p.set_name_from_params_or_default()

        p
      end

      it { subject.name.should eq I18n.t('projects.defaults.name') }
    end
  end


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
