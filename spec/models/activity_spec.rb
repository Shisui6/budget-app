require 'rails_helper'

RSpec.describe Activity, type: :model do
  user = User.create(name: 'test', email: 'test@gmail.com', password: 'qwerty')
  subject { Activity.create(user_id: user.id, name: 'test', amount: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount must be greater than 0' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end
end
