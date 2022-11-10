class LineItemDatesController < ApplicationController
  def new
    @quote = Quote.find(params[:quote_id])
    @line_item_date = LineItemDate.new
  end

  def create
    @quote = Quote.find(params[:quote_id])
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    if @line_item_date.save
      redirect_to @quote, notice: "Date was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
