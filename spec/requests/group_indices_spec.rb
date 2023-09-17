require 'rails_helper'

RSpec.describe 'GroupIndices', type: :request do
  describe 'GET /group_indices' do
    let!(:user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com', password: '123123') }
    it 'works! (now write some real specs)' do
      sign_in user
      get groups_path
      expect(response).to have_http_status(200)
    end
  end
end
