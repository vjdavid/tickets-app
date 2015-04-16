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
    it "create an object from instance" do
      proyect = FactoryGirl.attributes_for(:proyect)
      post(:create, { proyect: proyect })

      body = JSON.parse(response.body)
      body['name'].should eq proyect[:name]
    end
  end

  describe "DELETE #destroy" do
    it "delete a object" do
      proyect = FactoryGirl.create(:proyect)
      expect {
        delete :destroy, :id => proyect.id
      }.to change(Proyect, :count ).by(-1)
    end
  end

  describe "PUT #update" do
    it "update object" do
      proyect = FactoryGirl.create(:proyect)
      put :update, id: proyect, proyect: FactoryGirl.attributes_for(:proyect, name: "Holis")
      proyect.reload
      expect(proyect.name).to eq('Holis')
    end
  end

  describe "GET #show" do
    it "show a object from an record" do
    proyect = FactoryGirl.create(:proyect)
      get :show, id: proyect
      expect(assigns(:proyect)).to eq proyect
    end
  end

end
