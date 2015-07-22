class SignatureValidator < ActiveModel::Validator
  def validate(sig)
  	if BitcoinAddress.find_by_bitcoin_address(sig.signature_address)

  	else
  		if sig.signature_address == false
  			sig.errors[:base] << "Invalid signature! Please use bitcoin software to sign the message."
  		else
      		sig.errors[:base] << "Signature not accepted. Either it is invalid or your bitcoin address (#{sig.signature_address}) is empty."
      	end
  	end
  end
end