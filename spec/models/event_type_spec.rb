require 'rails_helper'

RSpec.describe EventType, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:event_type).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:event_type, name: nil).should_not be_valid
  end
end
