class BackgroundWorker

  def work
    Rails.logger.info "Background worker started."
    loop do
      sleep(10) # don't DOS blockchain.info neither our database
      update_bitcoin_balance
      hide_old_arguments_without_signature
    end
  end

  def update_bitcoin_balance
    BitcoinAddress.unscoped.order("updated_at ASC").first.try(:update_balance)
  end

  def hide_old_arguments_without_signature
    Argument.visible.where('created_at < ? and all_sum = 0', 3.days.ago).each do |a|
      Rails.logger.info "Hiding argument #{a.slug}: #{a.statement}"
      a.hide!
    end
  end

end
