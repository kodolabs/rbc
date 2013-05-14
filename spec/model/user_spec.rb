require 'spec_helper'

describe User do

  it { should validate_presence_of :email }

  context 'when email is not valid' do
    specify 'should not allow' do
      User.new(email: 'blablabla').should_not be_valid
      User.new(email: 'blablabla@blablabla').should_not be_valid
    end
  end

  context 'when email is valid' do
    specify 'should be ok' do
      User.new(email: 'blablabla@bla.com').should be_valid
      User.new(email: 'blablabla@blabl.abla').should be_valid
    end
  end
end
