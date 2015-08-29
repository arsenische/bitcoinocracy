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

	def pros_sum
		pros.uniq.sum(&:balance)
	end

	def cons_sum
		cons.uniq.sum(&:balance)
	end

	def calculate_validity
		# pros.sum(:balance) - cons.sum(:balance)
		# ^--- disabled due to bug in rails
		pros_sum - cons_sum # workaround
	end

	def update_validity
		update_attribute :validity, calculate_validity
	end
end
