require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.create(name: 'test', email: 'test@gmail.com', password: 'qwerty')
  subject { Group.create(user_id: user.id, name: 'test', icon: 'icon') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
