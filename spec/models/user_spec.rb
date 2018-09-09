require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user)}
  
  # subject { build(:user)}
  # before { @user = FactoryGirl.build(:user) }

  # it { expect(subject).to respond_to(:email)}
  # it { is_expected.to respond_to(:email)}
  # it { expect(user).to respond_to(:email)}
  
  # context 'when name is blank' do
  #   before {user.name = ''}
  #   it { expect(user).not_to be_valid }
  # end

  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive}
  it { is_expected.to validate_confirmation_of(:password)}
  it { is_expected.to allow_value('costa@nonato.com').for(:email)}
  it { is_expected.to validate_uniqueness_of(:auth_token)}

  describe '#info' do
    it 'return email and created_at' do
      user.save!

      expect(user.info).to eq("#{user.email} - #{user.created_at}")
    end
  end
end
