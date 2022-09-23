require 'rails_helper'

RSpec.describe 'Entities', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'test', email: 'example@email.com', password: '123456')
    @group = @user.groups.create(name: 'test', icon: 'https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg')
    @entity = @user.entities.create(name: 'test', amount: 100.20)
    @group_entity = @group.group_entities.create(group_id: @group.id, entity_id: @entity.id)
    sign_in @user
  end

  it 'should show correct entity' do
    visit group_entities_path(@group)
    expect(page).to have_content(@entity.name)
  end

  it 'should show correct amount' do
    visit group_entities_path(@group)
    expect(page).to have_content(@entity.amount)
  end
end
