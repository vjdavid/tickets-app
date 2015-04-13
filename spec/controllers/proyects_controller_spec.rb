
RSpec.describe ProyectsController do

  describe "GET #index" do 
	 it "display all proyects from @proyects" do
	  create(:proyect)
		proyects = Proyect.all
		get :index
    expect(assings(:proyects)).to eq(proyects)
	  end
	end

end
