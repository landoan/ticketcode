require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    user = create(:user)
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'shows only upcoming events' do
      upcoming_events = Array.new(5) { Event.create(name: Faker::Commerce.product_name, start_at: 5.hours.from_now, end_at: 6.hours.from_now, is_published: true, location_id: 1, event_type_id: 1, user_id: 1) }
      past_events = Array.new(5){ Event.create(name: Faker::Commerce.product_name, start_at: 2.minute.ago, end_at: 1.minutes.ago, is_published: true, location_id: 1, event_type_id: 1, user_id: 1) }
      get :index
      expect(assigns(:events)).to match_array(upcoming_events)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "create new record" do
      get :new
      expect(assigns(:event)).to be_a(Event)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      eventT = Event.create(name: Faker::Commerce.product_name, start_at: 5.hours.from_now, end_at: 6.hours.from_now, is_published: true, location_id: 1, event_type_id: 1, user_id: 1, event_image: 'string', summary: 'text', description: 'text')
      get :create, :event => eventT
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      event1 = Event.new(name: Faker::Commerce.product_name, start_at: 5.hours.from_now, end_at: 6.hours.from_now, is_published: true, location_id: 1, event_type_id: 1, user_id: 1)
      event1.save
      get :edit, id: event1.id
      expect(response).to have_http_status(:success)
    end

    it "edit new record" do
      event1 = Event.new(name:'some name', event_type_id:1, start_at: Faker::Time.forward(20, :morning), end_at: Faker::Time.forward(24, :morning))
      puts event1.save
      get :edit, :id => 1
      expect(assigns(:event)).to match(event1)
    end
  end

  describe "GET #update" do
    let(:attr) do
      { :name => "new name", :description => "new description", :event_type_id => 2 }
    end
    it "returns http success" do
      event1 = Event.new(name:'some name', event_type_id: 1, start_at: Faker::Time.forward(20, :morning), end_at: Faker::Time.forward(24, :morning))
      event1.save

      put :update, :id => event1.id, :event => attr
      event1.reload

      expect(response).to redirect_to(events_index_path)
    end
  end


end
