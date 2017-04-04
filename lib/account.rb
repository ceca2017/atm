class Account
  attr_accessor :pin_code, :account_status, :balance
  attr_reader :exp_date

  STANDARD_VALIDITY_YRS = 5
  OPEN_BALANCE = 0

  def initialize
    @pin_code = set_pin_code
    @exp_date = set_exp_date
    @account_status = :active
    @balance = OPEN_BALANCE
  end

  def deactivate
    @account_status = :deactivated
  end

  def deposit(amount)
    @balance += amount
  end

  private

  def set_pin_code
    rand(1000..9999)
  end

  def set_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end




end
