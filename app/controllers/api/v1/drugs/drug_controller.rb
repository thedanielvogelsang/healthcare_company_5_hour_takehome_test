class Api::V1::Drugs::DrugController < ApplicationController

  def index
    render json: Drug.all, status: 202
  end

  def show
    if Drug.exists?(params[:id])
      render json: Drug.find(params[:id]), status: 202
    else
      render json: {error: "Drug does not exist"}, status: 404
    end
  end
end
