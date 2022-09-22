require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'test', email: 'example@email.com', password: '123456')
    @group = @user.groups.create(name: 'test', icon: 'https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg')
    sign_in @user
  end

  it 'should show correct group name' do
    visit group_index_path
    expect(page).to have_content(@group.name)
  end

  it 'should show correct group icon' do
    visit group_index_path
    expect(page).to have_css("img[  src='https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg']")
  end

  it 'should redirect to new group page' do
    visit group_index_path
    click_on 'Add Category'
    expect(page).to have_curent_path(new_group_path)
  end
end
