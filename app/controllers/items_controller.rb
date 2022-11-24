class ItemsController < ApplicationController
  def new
    @item = Item.all
  end

  def create
    @item = Item.create(name: items_params[:name],
                        amount: items_params[:amount],
                        author_id: current_user.id)

    if @item.save
      save_group_item(@item)
      redirect_to group_path(params[:group_id]), notice: 'Successfully created an item spending'
    else
      render 'new', alert: 'Group item failed to create'
    end
  end

  private

  def save_group_item(category)
    @group_item = GroupItem.create(
      item_id: category.id,
      group_id: params[:group_id]
    )
  end

  def items_params
    params.require(:category).permit(:name, :amount)
  end
end
