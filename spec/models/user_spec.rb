require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers
  subject do
    User.new(name: 'test', email: 'example@email.com', password: '123456')
  end

  before { subject.save }
  it 'is valid with valid attributes' do
    subject.name = 'test'
    expect(subject).to be_valid
  end
end
