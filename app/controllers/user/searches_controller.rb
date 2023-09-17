class User::SearchesController < ApplicationController

  def search
    @shops = Shop.looks(params[:search], params[:word])
  end

end
