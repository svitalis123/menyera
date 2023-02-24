require_relative '../rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'eat') }
  before { subject.save }
  it 'should validate name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should validate name' do
    expect(subject.name).to eq('eat')
  end
end
