class Transaction < ApplicationRecord
  ulid :wallet_id

  enum transaction_type: {
    deposit: 'deposit',
    withdraw: 'withdraw',
    transfer: 'transfer'
  }

  store_accessor :details, :source_wallet_id
  store_accessor :details, :destination_wallet_id

  belongs_to :wallet

  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :sufficient_balance

  def balance_sufficient?
    amount <= wallet.balance
  end

  private

  def sufficient_balance
    errors.add(:amount, 'unsufficient wallet balance') unless balance_sufficient?
  end
end
