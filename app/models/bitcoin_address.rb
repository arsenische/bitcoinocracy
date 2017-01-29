require 'net/http'
class BitcoinAddress < ActiveRecord::Base
  default_scope { order('balance DESC, bitcoin_address ASC') }

  has_many :signatures
  has_many :arguments, through: :signatures

  def request_balance url
    (Integer(Net::HTTP.get(URI.parse(url))) rescue false)
  end

  def update_balance
    res = request_balance("https://blockchain.info/q/addressbalance/#{self.bitcoin_address}") ||
          request_balance("https://blockexplorer.com/api/addr/#{self.bitcoin_address}/balance")

    if res!=false
      if ( (new_balance=res.to_i) >= 0) and (new_balance != self.balance)
        logger.info "new balance for #{self.bitcoin_address}: #{new_balance}"
        update_attribute :balance, new_balance
        arguments.each{|a|a.update_validity}
      else
        touch :updated_at # push it to the end of the queue
      end
    else
      logger.warn "failed to retrieve balance for bitcoin address #{self.bitcoin_address}"
    end
  end

end
