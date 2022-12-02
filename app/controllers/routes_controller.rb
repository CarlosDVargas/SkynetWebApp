class RoutesController < ApplicationController
  before_action :set_route, only: %i[ show edit update destroy ]
  before_action :set_operations, only: %i[ new edit create update ]
  before_action :set_countries, only: %i[ new edit update create ]
  before_action :set_products, only: %i[ new edit update create ]

  # GET /routes or /routes.json
  def index
    @routes_length = Route.all.length
    @routes = Route.paginate(page: params[:page], per_page: 6)
  end

  # GET /routes/1 or /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes or /routes.json
  def create
    byebug
    set_operations_to_be_added
    @route = Route.new(route_params)
    @route.code = "code"
    @route.country_id = set_country_id
    respond_to do |format|
      if @route.save
        @operations_to_be_added.each do |operation|
          operation.route_id = @route.id
          operation.save
          @route.operations << operation
          @route.save
        end
        create_route_code
        @route.save
        format.html { redirect_to route_url(@route), notice: "Route was successfully created." }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1 or /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to route_url(@route), notice: "Route was successfully updated." }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1 or /routes/1.json
  def destroy
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url, notice: "Route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_route
    @route = Route.find(params[:id])
  end

  def set_countries
    @countries = Country.all
  end

  def set_country_id
    @country_id = current_user.last_connected_country
  end

  def set_operations
    @operations = Operation.all
  end

  def set_products
    @products = Product.all
  end

  def create_route_code
    product = Product.find(params[:route][:product_id].to_i)
    @route.code = @route.country.code + product.code + @operations_to_be_added.length.to_s
  end
  def set_operations_to_be_added
    @operations_to_be_added = []
    operations = params[:selected_operations]
    operations.each do |operation|
      @operations_to_be_added << Operation.find(operation.to_i)
    end
  end
  # Only allow a list of trusted parameters through.
  def route_params
    params.require(:route).permit(:description, :country_id)
  end
end
