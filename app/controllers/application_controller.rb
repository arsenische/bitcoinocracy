class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_bitcoin_balance # since we don't yet have a background task, we need this hack :(

  def update_bitcoin_balance    
    if rand > 0.9 return # don't slowdown 90% of requests

    if BitcoinAddress.where('updated_at > ?',10.seconds.ago).empty? # don't DOS blockchain.info
      bitcoin_address = BitcoinAddress.unscoped.order("updated_at ASC").first
      if bitcoin_address.updated_at < 10.minutes.ago # no need to do it too often
        bitcoin_address.update_balance
      end
    end
    
  end

end
