RSpec.describe ProyectsController do

  describe 'GET #index' do 
	  it "display all proyects from @proyects" do
		proyects = Proyect.all
		get :index
    expects(assings(:proyects)).to eq(proyects)
	  end
	end

end
