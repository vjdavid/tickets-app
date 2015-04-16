require "rails_helper"
require "pry"

RSpec.describe TicketsController, :type => :controller do

  describe "GET #index" do
    it "retrve from an object" do
      FactoryGirl.create(:ticket)
      tickets = Ticket.all
      get :index
      expect(tickets).to eq(tickets)
    end
  end

end
