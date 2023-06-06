require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:wallet) { create(:wallet, :for_user) }

  describe 'Amount validation' do
    it 'can greater than 0' do
      expect(wallet.transactions.create(amount: 10)).to be_valid
    end

    it 'should have presence of amount' do
      expect(wallet.transactions.create(amount: nil)).to_not be_valid
    end

    it 'can not be 0' do
      expect(wallet.transactions.create(amount: 0)).to_not be_valid
    end

    it 'can not less than 0' do
      expect(wallet.transactions.create(amount: -10)).to_not be_valid
    end
  end
end
