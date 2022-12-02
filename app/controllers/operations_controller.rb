class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]

  # GET /operations or /operations.json
  def index
    @operations_length = Operation.all.length
    @operations = Operation.paginate(page: params[:page], per_page: 6)

  end

  # GET /operations/1 or /operations/1.json
  def show
    @batches_length = @operation.batches.length
    @batches = @operation.batches.paginate(page: params[:page], per_page: 2)
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    #byebug
    @operation = Operation.new(operation_params)
    @operation.country_id = set_country_id
    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  def set_country_id
    @country_id = current_user.last_connected_country
  end

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:description, :route_id, :code)
  end
end
