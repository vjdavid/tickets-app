require "rails_helper"

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
		FactoryGirl.create(:proyect)
		proyect.create
		get :post
	  end
  end

end
