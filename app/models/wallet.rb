class Wallet < ApplicationRecord
  ulid :entityable_id

  belongs_to :entityable, polymorphic: true

  has_many :transactions, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :set_default_balance, if: -> { new_record? }

  private

  def set_default_balance
    self.balance ||= 0
  end

end
