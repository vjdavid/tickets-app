
RSpec.describe ProyectsController do

  describe "GET #index" do 
	 it "display all proyects from @proyects" do
	   FactoryGirl.create(:proyect)
		 proyects = Proyect.all
		 get :index
		 expect(assings(:proyects)).to eq(proyects)
	  end
	end

end
