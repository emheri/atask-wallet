require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:wallet) { build(:wallet, :for_user) }

  describe 'Balance validation' do
    it 'have default 0' do
      user = create(:user)
      wallet = user.create_wallet

      expect(wallet).to be_valid
      expect(wallet.balance).to eq(0)
    end

    it 'balance can greater than 0' do
      wallet.balance = 100
      wallet.save

      expect(wallet).to be_valid
      expect(wallet.balance).to eq(100)
    end

    it 'balance can eq 0' do
      wallet.save # factories already set to 0

      expect(wallet).to be_valid
      expect(wallet.balance).to eq(0)
    end

    it 'can not less than 0' do
      wallet.balance = -100
      wallet.save

      expect(wallet).to_not be_valid
    end
  end
end
