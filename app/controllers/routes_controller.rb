class RoutesController < ApplicationController
  attr_accessor :route
  before_action :set_route, only: %i[ show edit update destroy ]
  before_action :set_operations, only: %i[ new edit create update ]
  before_action :set_countries, only: %i[ new edit update create ]
  before_action :set_products, only: %i[ new edit update create ]

  # GET /routes or /routes.json
  def index
    @routes = Route.where(country_id: set_country_id)
    @routes_length = Route.where(country_id: set_country_id).length
    if @routes.nil? || @routes.empty?
      @routes = []
    else
      @routes = @routes.paginate(page: params[:page], per_page: 6)
    end
  end

  # GET /routes/1 or /routes/1.json
  def show
    unless @route.products.empty?
      products_length = @route.products.length
      @products = @route.products.paginate(page: params[:page], per_page: 2)
    else
      @products = []
    end
    operations_length = @route.operations.length
    @operations = @route.operations.paginate(page: params[:page], per_page: 2)
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
    set_operations_to_be_added
    @route = Route.new(route_params)
    @route.code = "code" + Random.random_number(1000).to_s
    @route.country_id = set_country_id
    unless @operations_to_be_added.empty?
      @operations_to_be_added.each do |operation|
        operation.route_id = @route.id
        operation.save
        @route.operations << operation
      end
    end
    create_route_code
    respond_to do |format|
      if @route.save
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
    @operations = Operation.where(country_id: set_country_id, route_id: nil)
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
    unless operations.nil?
      operations.each do |operation|
        @operations_to_be_added << Operation.find(operation.to_i)
      end
    end
  end

  # Only allow a list of trusted parameters through.
  def route_params
    params.require(:route).permit(:description, :country_id)
  end
end
