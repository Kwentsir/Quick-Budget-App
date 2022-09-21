# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entity, type: :model do
   subject do
    user = User.create(name: 'test', email: 'example@email.com', password: '123456')
    Entity.new(name: 'test', amount: 100.10, author: user)
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

   it 'should have a valid amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
   end
end
