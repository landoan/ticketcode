require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:event).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:event, name: nil).should_not be_valid
  end

  it "is invalid without a date" do
    FactoryGirl.build(:event, date: nil).should_not be_valid
  end
end
