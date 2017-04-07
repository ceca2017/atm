require './lib/Account.rb'
require './lib/atm.rb'
require 'pry-byebug'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account = nil
  end


  def create_account
    @account = Account.new({ owner: self })
  end

  #def deposit(amount)
  #  #binding.pry
  #  self.account == nil ? missing_account(amount) : self.account.deposit(amount)
  #end

  def deposit(amount)
    if self.account == nil
      missing_account
    else
      self.account.deposit(amount)
      @cash -= amount
    end
  end


  def withdraw(attrs = {})
    if self.account == nil
      missing_account
    else
      #binding.pry
      check_withdraw_attrs(attrs)
      reply = attrs[:atm].withdraw(attrs[:amount], attrs[:pin], attrs[:account])
      reply[:status] == false ? reply : @cash += reply[:amount]
    end
  end



  private

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end

  def missing_account
    raise "No account present"
  end

  def check_withdraw_attrs(attrs)
    if attrs[:atm] == nil
      raise 'An ATM is required'
    end
  end

end
