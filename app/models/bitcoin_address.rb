require 'net/http'
class BitcoinAddress < ActiveRecord::Base
  default_scope { order('balance DESC') }

  has_many :signatures
  has_many :arguments, through: :signatures

  def update_balance
    res = Net::HTTP.get(URI.parse("https://blockchain.info/q/addressbalance/#{self.bitcoin_address}"))
    if ( (new_balance=res.to_i) >= 0) and (new_balance != self.balance)
      update_attribute :balance, new_balance
      arguments.each{|a|a.update_validity}
    else
      touch :updated_at # push it to the end of the queue
    end
  end

end
