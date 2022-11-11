class LineItemDatesController < ApplicationController
  before_action :set_line_item_date, only: %i[edit update destroy]
  before_action :set_quote
  def new
    @line_item_date = LineItemDate.new
  end

  def create
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
    if @line_item_date.update(line_item_date_params)
      redirect_to quote_path(@quote), notice: "Quote was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy
    redirect_to quote_path(@quote), notice: "Quote was successfully destroy"
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = LineItemDate.find(params[:id])
  end
end
