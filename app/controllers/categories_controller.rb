class CategoriesController < ApplicationController
  #before_action :require_admin, except: [:show, :index] 

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    @category.assign_attributes(category_params)

    if @category.save
      flash[:notice] = "Topic was updated."
      redirect_to @category
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:amount)
    end

    def require_admin
      if !logged_in? ||(logged_in? && !current_user.admin?)
        flash[:info] = "Solo administradores pueden hacerlo"
        redirect_to categories_path
      end      
    end
end
