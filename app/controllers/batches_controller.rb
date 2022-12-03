class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy ]
  before_action :set_products, only: %i[ new edit create update ]
  before_action :set_operations, only: %i[ new edit create update ]

  # GET /batches or /batches.json
  def index
    @batches = Batch.all
  end

  # GET /batches/1 or /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)
    @batch.code = create_batch_code
    @batch.country_id = set_country_id
    respond_to do |format|
      if @batch.save
        @operation = Operation.find(@batch.operation_id)
        format.html { redirect_to operation_url(@operation), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_batch
    @batch = Batch.find(params[:id])
  end

  def set_products
    @products = Product.all
  end

  def set_operations
    @operations = Operation.where(country_id: set_country_id)
  end

  def create_batch_code
    user = current_user
    country = Country.find(user.last_connected_country)
    country_code = country.code
    @product = Product.find(@batch.product_id)
    product_code = @product.code
    date = Date.today
    year = date.year
    @batch_code = "#{country_code}#{year}#{product_code}"
  end

  def set_country_id
    @country_id = current_user.last_connected_country
  end

  # Only allow a list of trusted parameters through.
  def batch_params
    params.require(:batch).permit(:product_id, :operation_id, :current_operation, :units)
  end
end
