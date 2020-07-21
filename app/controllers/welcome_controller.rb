class WelcomeController < ApplicationController
    def index
      @top_orders = Order.all
    end
end