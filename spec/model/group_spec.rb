require_relative '../rails_helper'
RSpec.describe Group, type: :model do
  subject { Group.new(name: 'eat', icon: 'https:', user_id: 1) }
  before { subject.save }
  it 'should validate name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should validate icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
  it 'should validate name' do
    expect(subject.name).to eq('eat')
  end
  it 'should validate icon' do
    expect(subject.icon).to eq('https:')
  end
end
