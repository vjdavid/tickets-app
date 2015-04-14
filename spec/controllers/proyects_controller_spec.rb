require "rails_helper"

RSpec.describe ProyectsController, :type => :controller do

  describe "GET #index" do 
	 it "display all proyects from @proyects" do
	   FactoryGirl.create(:proyect)
		 proyects = Proyect.all
		 get :index
		 expect(assings(:proyects)).to eq(proyects)
	  end
	end

end
