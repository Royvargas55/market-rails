class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  #before_action :category_orders_statuses_count, only: [:index, :complete]
  #before_action :all_order_statuses_count, only: [:all_active_orders, :all_complete_orders]
  def index
    @order = Order.all
  end
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
    @order.assign_attributes(order_params)

    if @order.save
      flash[:notice] = "Post was updated."
      redirect_to [@order.category, @order]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
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

  def boss_approved
    @order = Order.find(params[:id])
    @order.boss_approved!

    redirect_to root_path, notice: 'You has finished task'
  end

  def boss_disapproved
    @order = Order.find(params[:id])
    @order.boss_disapproved!
    #ApprovalMailer.new_status(@order.user, @order).deliver_now
    redirect_to root_path, notice: 'Lets work!'
  end

  def financial_approved
    @order = Order.find(params[:id])
    @order.financial_approved!

    redirect_to root_path, notice: 'Lets work!'
  end

  def financial_disapproved
    @order = Order.find(params[:id])
    @order.financial_disapproved!

    redirect_to root_path, notice: 'Lets work!'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
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
