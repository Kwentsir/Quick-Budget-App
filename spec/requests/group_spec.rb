require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'test', email: 'example@email.com', password: '123456')
    @group = @user.groups.create(name: 'test', icon: 'https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get group_index_path
      expect(response).to have_http_status(:success)
    end
  end
end
