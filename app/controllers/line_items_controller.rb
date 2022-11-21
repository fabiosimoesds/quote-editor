class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[edit update destroy]
  before_action :set_line_item_date, only: %i[new create edit]
  before_action :set_quote

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      redirect_to quote_path(@quote), notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to quote_path(@quote), notice: "Item was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy
    redirect_to quote_path(@quote), notice: "Item was successfully deleted."
  end

  private

  def set_line_item_date
    @line_item_date = LineItemDate.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def line_item_params
    params.require(:line_item).permit(:name, :description, :quantity, :unit_price)
  end
end
