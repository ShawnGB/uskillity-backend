require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'email is unique' do
    subject { User.make }
    # TODO decide if emails shall be unique
    #it { expect(subject).to validate_uniqueness_of(:email) }
  end

  describe 'email validation' do
    it { expect(subject).to allow_value('email@addresse.foo').for(:email) }
    it { expect(subject).not_to allow_value('foo').for(:email) }
  end

end
