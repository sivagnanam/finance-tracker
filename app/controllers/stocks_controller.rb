class StocksController < ApplicationController 
    def search
        #byebug
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock]) 
            #render json: @stock 
            if @stock 
                #render 'users/my_portfolio'
                respond_to do |format|
                    format.js {render partial: 'users/result'}
                end
            else
                respond_to do |format|
                    flash.now[:alert] ="Invalid Symbol"
                    format.js {render partial: 'users/result'}
                    #redirect_to my_portfolio_path
                end 
            end
        else
            respond_to do |format|
                flash.now[:alert] ="please enter a symbol"
                format.js {render partial: 'users/result'}
                #redirect_to my_portfolio_path
            end
        end

    end
end