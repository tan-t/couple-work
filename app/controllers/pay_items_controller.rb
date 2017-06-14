class PayItemsController < ApplicationController
  before_action :set_pay_item, only: [:show, :edit, :update, :destroy]

  # GET /pay_items
  # GET /pay_items.json
  def index
    @pay_items = PayItem.all
  end

  # GET /pay_items/1
  # GET /pay_items/1.json
  def show
  end

  # GET /pay_items/new
  def new
    @pay_item = PayItem.new
    2.times{
      @pay_item.pay_item_details.build
    }
  end

  # GET /pay_items/1/edit
  def edit
  end

  # POST /pay_items
  # POST /pay_items.json
  def create
    @pay_item = PayItem.new(pay_item_params)

    respond_to do |format|
      if @pay_item.save
        format.html { redirect_to @pay_item, notice: 'Pay item was successfully created.' }
        format.json { render :show, status: :created, location: @pay_item }
      else
        format.html { render :new }
        format.json { render json: @pay_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_items/1
  # PATCH/PUT /pay_items/1.json
  def update
    respond_to do |format|
      if @pay_item.update(pay_item_params)
        format.html { redirect_to @pay_item, notice: 'Pay item was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_item }
      else
        format.html { render :edit }
        format.json { render json: @pay_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_items/1
  # DELETE /pay_items/1.json
  def destroy
    @pay_item.destroy
    respond_to do |format|
      format.html { redirect_to pay_items_url, notice: 'Pay item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_item
      @pay_item = PayItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_item_params
      params.require(:pay_item).permit(:id, :code, :name,
      :pay_item_details_attributes => [:id,:pay_item_id,:key,:value])
    end
end
