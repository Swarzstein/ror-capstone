require 'rails_helper'

RSpec.describe "GroupIndices", type: :request do
  describe "GET /group_indices" do
    it "works! (now write some real specs)" do
      get group_indices_path
      expect(response).to have_http_status(200)
    end
  end
end
