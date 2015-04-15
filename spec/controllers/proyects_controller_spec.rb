require "rails_helper"
require "pry"

RSpec.describe ProyectsController, :type => :controller do

  describe "GET #index" do
   it "display all proyects from @proyects" do
     FactoryGirl.create(:proyect)
     proyects = Proyect.all
     get :index
     expect(proyects).to eq(proyects)
    end
  end

  describe "POST #create" do
    it "create an objet from instance" do
      proyect = FactoryGirl.attributes_for(:proyect)
      post(:create, { proyect: proyect })

      body = JSON.parse(response.body)
      body['name'].should eq proyect[:name]
    end
  end

  describe "DELETE #destroy" do
    it "delete a objet from" do
      proyect = FactoryGirl.create(:proyect)
      expect {
        delete :destroy, :id => proyect.id
      }.to change(Proyect, :count ).by(-1)
    end
  end

end
