require './lib/account.rb'
require 'date'

describe Account do
  let(:person) { instance_double('Person', name: 'Claes')}
  subject { described_class.new(100, {owner: person}) }


  it 'has a pincode on initialize' do
    expect(subject.pin_code).not_to eq nil
  end

  it 'check that pin code has 4 numbers' do
    number_length = subject.pin_code.to_s.length
    expect(number_length).to eq 4
  end

  it "has a expiration date 5 years later on initialize" do
    expected_date = Date.today.next_year(5).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  it "is active on initialize" do
    expect(subject.account_status).to eq :active
  end

  it "has an open balance of 100" do
    expect(subject.balance).to eq 100
  end

  it "can be not activated (deactivated) using instance method" do
    subject.deactivate
    expect(subject.account_status).not_to eq :active
  end

  xit "has a balance of 0 on initialize" do
    expect(subject.balance).to eq 0
  end

  it "can deposit an amount" do
    subject.deposit(100)
    expect(subject.balance).to eq 200
  end

  it "is expected to have an owner" do
    expect(subject.owner).to eq person
  end

  it "is expected to raise error if no owner is set" do
    expect { described_class.new(100) }.to raise_error 'An Account owner is required'
  end




end
