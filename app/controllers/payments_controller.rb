# Service to download ftp files from the server
class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new create edit update]
  before_action :authenticate_user!

  # GET /payments or /payments.json
  def index
    @payments = current_user.payments.recent
  end

  # GET /payments/1 or /payments/1.json
  def show; end

  # GET /payments/new
  def new
    @payment = @category.payments.build
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    @payment = @category.payments.build(payment_params)
    @payment.user = current_user

    respond_to do |format|
      if @payment.save
        format.html { redirect_to category_url(@category), notice: 'Payment was successfully added.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to category_url(@payment.category), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    category = @payment.category
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to category_url(category), notice: 'Payment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
    authorize_user!(@payment.user)
  end

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def authorize_user!(resource_user)
    redirect_to root_path, alert: 'Not authorized' unless resource_user == current_user
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end
