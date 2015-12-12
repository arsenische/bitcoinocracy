class Argument < ActiveRecord::Base

  extend FriendlyId
  friendly_id :statement, use: :slugged

	has_many :signatures

	has_many :pro_signatures, -> { where negation: false}, class_name: 'Signature'
	has_many :con_signatures, -> { where negation: true}, class_name: 'Signature'


	has_many :pros, -> { uniq }, through: :pro_signatures, class_name: 'BitcoinAddress', source: :bitcoin_address
	has_many :cons, -> { uniq }, through: :con_signatures, class_name: 'BitcoinAddress', source: :bitcoin_address

	def pro_statement
		"I believe that #{statement}"
	end

	def con_statement
		"I doubt that #{statement}"
	end

	def pros_share
		all_sum > 0 ? 1.0*pros_sum/all_sum : nil
	end

	def cons_share
		all_sum > 0 ? 1.0*cons_sum/all_sum : nil
	end

	def update_validity
		self.pros_sum = pros.uniq.sum(&:balance)
		self.cons_sum = cons.uniq.sum(&:balance)
		self.validity = pros_sum - cons_sum
		self.all_sum = pros_sum + cons_sum
		self.min_sum = [pros_sum, cons_sum].min
		save!
	end

end
