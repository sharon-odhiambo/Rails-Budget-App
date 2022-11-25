require 'rails_helper'

RSpec.describe 'Group model', type: :model do
  subject do
    User.create(name: 'Sharon', email: 'sharon@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'Total amount for Transaction' do
    group1 = Group.create(name: 'Forodhani', icon: 'food', user_id: subject.id)
    item1 = Item.create(name: 'Biryani', amount: 50, author_id: subject.id)
    item2 = Item.create(name: 'Mutton', amount: 45, author_id: subject.id)
    GroupItem.create(item_id: item1.id, group_id: group1.id)
    GroupItem.create(item_id: item2.id, group_id: group1.id)

    value = Group.total_spending(group1.id)

    expect(value).to eq(190)
  end
end
