require './lib/person.rb'
require './lib/atm.rb'
#require 'pry'

describe Person do

  subject { described_class.new(name: 'Claes') }

  it "is expected to have a :name on initialize" do
    expect(subject.name).not_to be nil
  end

  it "is expected to raise error if no name is set" do
    expect { described_class.new }.to raise_error 'A name is required'
  end

  it "is expected to have a :cash attribute with value of 0 on initialize" do
    expect(subject.cash).to eq 0
  end

  it "is expected to have a :account attribute" do
    expect(subject.account).to be nil
  end

  describe 'can create an Account' do
    # As a Person
    # in order to be able to use banking services to manage my funds,
    # I would like to be able to create a bank account
    before { subject.create_account }

    it "of Account class" do
      expect(subject.account).to be_an_instance_of Account
    end

    it "with himself as an owner" do
      expect(subject.account.owner).to be subject
    end

  end

  describe 'can manage funds if no account been creted' do
    let(:atm) { Atm.new }
    # As a Person with a Bank Account,
    # in order to prevent me from using the wrong bank account,
    # I should NOT be able to make a deposit.

    xit "can't deposit" do
      expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
    end

  end

end
