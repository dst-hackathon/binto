class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
  	#logger.debug("\n\n\n\n#{dish_params.inspect}\n\n\n\n\n")
  
  	#restaurant_name = dish_params.delete("restaurant_name")
  	
  	#logger.debug("\n\n\n\n#{dish_params.delete("restaurant_name")}\n\n\n\n\n")
  
    @dish = Dish.new()
    @dish.name = dish_params[:name]
    @dish.image_code = dish_params[:image_code]
    @dish.price = dish_params[:price]
    
    @dish.restaurant_id = @dish.populate_restaurant(dish_params[:restaurant_name])

    respond_to do |format|
      if @dish.save
        #format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @dish }
        format.json { render :json => { "success" => true, "dish" => @dish.as_json(only: [:id]) }, status: :created }
        format.html { render :json => { "success" => true, "dish" => @dish.as_json(only: [:id]) }, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
      format.json { head :no_content }
    end
  end

  def suggest
  	if session[:dish_ids].blank?  	
    	dish_ids = Dish.all.map(&:id)
    	session[:dish_ids] = dish_ids
    else
    	dish_ids = session[:dish_ids]
    end
    
    dish_id = dish_ids[rand(dish_ids.length)]
    session[:dish_ids].delete(dish_id)
    
   respond_to do |format|
      format.json { @dish = Dish.find(dish_id)  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :image_code, :price, :restaurant_id, :restaurant_name)
    end
end
