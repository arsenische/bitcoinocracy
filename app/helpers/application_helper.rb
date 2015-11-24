module ApplicationHelper 
	def btc_human(satoshies, separator=' ')
		"%.8f#{separator}Ƀ" % (1.0*satoshies.to_i/1e8)
	end

  def percent_human(x)
    if x.present?
      "(%.2f%%)" % (100.0*x)
    else
      ""
    end
  end
end
