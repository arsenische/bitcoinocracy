class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :do_background_jobs # since we don't yet have a background job, we need this hack :(

  def do_background_jobs
    update_bitcoin_balance if rand < 0.1 # don't slowdown 90% of the requests
    hide_old_arguments_without_signature
  end

  def update_bitcoin_balance
    if BitcoinAddress.where('updated_at > ?',10.seconds.ago).empty? # don't DOS blockchain.info
      bitcoin_address = BitcoinAddress.unscoped.order("updated_at ASC").first
      if bitcoin_address.updated_at < 10.minutes.ago # no need to do it too often
        bitcoin_address.update_balance
      end
    end
  end

  def hide_old_arguments_without_signature
    Argument.visible.where('created_at < ? and all_sum = 0', 3.days.ago).each do |a|
      a.hide!
    end
  end

  def after_sign_in_path_for(resource)
    admin_root_path
  end

end
