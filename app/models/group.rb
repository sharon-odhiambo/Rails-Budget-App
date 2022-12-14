class Group < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
  def self.total_spending(group_id)
    sum = 0
    group_items = GroupItem.all
    group_items.each do |i|
      next unless i.group_id == group_id.to_i

      item = Item.where(id: i.item_id)
      sum += i.item.amount.to_i
    end
    sum
  end
end
