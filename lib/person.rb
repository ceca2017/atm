require './lib/Account.rb'
require 'pry-byebug'

class Person

  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0

  end


  def create_account
    @account = Account.new({ owner: self })
  end

  def deposit(amount)
    #binding.pry
    self.account == nil ? missing_account : self.account.deposit(amount)
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


end
