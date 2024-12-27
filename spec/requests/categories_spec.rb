require 'rails_helper'

#RSpec.describe "Categories", type: :request do
#  describe "GET /show" do
#    it "returns http success" do
#      get "/categories/1"
#      expect(response).to have_http_status(:success)
#    end
#  end
#
#end

RSpec.describe "Categories", type: :request do
  describe "GET /categories/:id" do
    #let(:category) { create(:category) }
    #@client = FactoryBot.create(:saa_test_client)
    #let!(:store) { FactoryBot.create(:store, store_id_ext: data[:store_id_ext], solucx_id: store_solucx_id) }

    let(:category) { FactoryBot.create(:category) }

    it "returns http success" do
      get "/categories/#{category.id}"
      expect(response).to have_http_status(:success)
    end

    it "renders the category details" do
      get "/categories/#{category.id}"
      expect(response.body).to include(category.name)
    end
  end
end
