class Public::HomesController < ApplicationController
def top
  @range = params[:range]
  search = params[:search]
  word = params[:word]
  @customers = Customer.looks(search, word)
end

end
