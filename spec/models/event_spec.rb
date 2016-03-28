require 'rails_helper'

RSpec.describe Event, type: :model do
 context 'validations' do
   it { validate_presence_of :name }
   #TODO check the rest
 end
end
