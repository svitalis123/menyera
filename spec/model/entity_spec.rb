require_relative '../rails_helper'
RSpec.describe Entity, type: :model do
  subject { Entity.new(name: 'hello', amount: 20, user_id: 1) }
  before { subject.save }
  context 'Validate inputs' do
    it 'should validate entity name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should validate entity amount' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should validate entity amount' do
      expect(subject.amount).to eq(20)
    end
    it 'should validate entity name' do
      expect(subject.name).to eq('hello')
    end
  end
end
