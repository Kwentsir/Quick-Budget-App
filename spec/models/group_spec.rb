# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    user = User.create(name: 'test', email: 'example@email.com', password: '123456')
    Group.new(name: 'test', icon: 'https://dashboard.microverse.org/assets/icon-white-6545162e585bbcd21acdfc30fbb9763ac2a42226c6a436f234a7bc370d4bf50f.png', author: user)
  end

  before { subject.save }
  it 'is valid with valid attributes' do
    subject.name = 'test'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a valid icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
