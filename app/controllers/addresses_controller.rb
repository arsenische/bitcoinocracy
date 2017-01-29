class AddressesController < ApplicationController

  def index
    @addresses = BitcoinAddress.all.page params[:page]

    redirect_to address_path(params[:bitcoin_address]) if params[:bitcoin_address].present?
  end

  def show
    @address = BitcoinAddress.find_by_bitcoin_address(params[:id])

    if @address.blank?
      redirect_to addresses_path, alert: "Sorry, bitcoin address '#{params[:id]}' is not found in the database"
    end
  end
end
