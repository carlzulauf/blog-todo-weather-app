class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "#{@item.title} was created successfully."

      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      flash[:notice] = "#{@item.title} was updated successfully."

      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy!

    redirect_to items_path
  end

  def mark_as_done
    @item = Item.find(params[:item_id])

    @item.completed_at = Time.now
    @item.save!

    flash[:notice] = "#{@item.title} was marked as done."

    redirect_to :back
  end

  private

  def item_params
    params.require(:item).permit(:title, :body)
  end
end
