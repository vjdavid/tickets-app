require "rails_helper"
require "pry"

RSpec.describe TicketsController, :type => :controller do

  describe "GET #index" do
    it "retrieve from an object" do
      proyect = FactoryGirl.create(:proyect)

      3.times do
        FactoryGirl.create(:ticket, proyect_id: proyect.id)
      end

      # request > rails
      # response < rails
      get :index, { :proyect_id => proyect.id}

      parsed_body = JSON.parse(response.body)

      expect(parsed_body.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "pull one a ticket with a correct id" do
      proyect = FactoryGirl.create(:proyect)
      ticket = FactoryGirl.create(:ticket, proyect_id: proyect.id)

      get :show, { id: ticket.id, proyect_id: proyect.id }
      res = JSON.parse(response.body)

      expect(ticket.id).to eq(res["id"])
    end

    it "pull one a ticket with a correct proyect_id" do
      proyect = FactoryGirl.create(:proyect)
      ticket = FactoryGirl.create(:ticket, proyect_id: proyect.id)

      get :show, { id: ticket.id, proyect_id: proyect.id }
      res = JSON.parse(response.body)

      expect(proyect.id).to eq(res["proyect_id"])
    end
  end

  describe "PUT #update" do
    it "update a ticket" do
      proyect = FactoryGirl.create(:proyect)
      ticket = FactoryGirl.create(:ticket, proyect_id: proyect.id)

      old_name = ticket.name

      put :update, { id: ticket.id, proyect_id: proyect.id, name: "holis" }

      parsed_response= JSON.parse(response.body)
      new_name = parsed_response["name"]

      expect(old_name).not_to eq(new_name)
    end
  end
end
