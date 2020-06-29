class OrdersController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @category = Category.find(params[:category_id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @category = Category.find(params[:category_id])
    @order = @category.orders.build(order_params)
    @order.user = current_user
    respond_to do |format|
      if @order.save
        format.html { redirect_to [@category, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:client, :project, :description)
    end

    def require_same_user
      if current_user != @order.user && !current_user.admin?
        flash[:info] = "Solo puedes editar o borrar tus grupos"
        redirect_to orders_path
      end   
    end
end
