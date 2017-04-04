require './lib/account.rb'
require 'date'

describe Account do

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

  it "can be not activated (deactivated) using instance method" do
    subject.deactivate
    expect(subject.account_status).not_to eq :active
  end

  it "has a balance of 0 on initialize" do
    expect(subject.balance).to eq 0
  end

  it "can deposit an amount" do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end




end
