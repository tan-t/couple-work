class AccountTermMstsController < BaseController
  before_action :set_account_term_mst, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  # GET /account_term_msts
  # GET /account_term_msts.json
  def index
    @account_term_msts = AccountTermMst.all
  end

  # GET /account_term_msts/1
  # GET /account_term_msts/1.json
  def show
  end

  # GET /account_term_msts/new
  def new
    @account_term_mst = AccountTermMst.next_term
  end

  # GET /account_term_msts/1/edit
  def edit
  end

  # POST /account_term_msts
  # POST /account_term_msts.json
  def create
    @account_term_mst = AccountTermMst.new(account_term_mst_params)

    respond_to do |format|
      if @account_term_mst.save
        format.html { redirect_to @account_term_mst, notice: 'Account term mst was successfully created.' }
        format.json { render :show, status: :created, location: @account_term_mst }
      else
        format.html { render :new }
        format.json { render json: @account_term_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_term_msts/1
  # PATCH/PUT /account_term_msts/1.json
  def update
    respond_to do |format|
      if @account_term_mst.update(account_term_mst_params)
        format.html { redirect_to @account_term_mst, notice: 'Account term mst was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_term_mst }
      else
        format.html { render :edit }
        format.json { render json: @account_term_mst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_term_msts/1
  # DELETE /account_term_msts/1.json
  def destroy
    @account_term_mst.destroy
    respond_to do |format|
      format.html { redirect_to account_term_msts_url, notice: 'Account term mst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_term_mst
      @account_term_mst = AccountTermMst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_term_mst_params
      params.require(:account_term_mst).permit(:year, :month, :start_date, :end_date, :closed)
    end
end
