require 'faker'

FactoryGirl.define do
  factory :proyect do
	  name { Faker::Name.name }
		description { Faker::Lorem.paragraph }
end	

RSpec.describe ProyectsController do

  describe 'GET #Index' do 
	  it "populates an array of messages" do
		  proyect = create(:proyect)
			get :index
			expect(assigns(:proyects)).to match_array [proyect]
	end

  it "renders thw :index view" do
	  get :index
		JSON.sholud_not render_template :index
		expect(response).to render_template :index
	end
  
end
