class Account
  attr_accessor :pin_code, :account_status, :balance, :owner
  attr_reader :exp_date

  STANDARD_VALIDITY_YRS = 5
  OPEN_BALANCE = 0

  def initialize(balance, attrs = {})
    @pin_code = set_pin_code
    @exp_date = set_exp_date
    @account_status = :active
    @balance = balance
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
    # I am using the instance method, as you need an instance of the class to run it
    # You want to deactivate the specific instance of class Account that you apply the
    # deactivate method on (my_account.deactivate)
    # To me it seems that you would create a class method in case you create module,
    # i.e. you do not operate on a specific instance. Math.pi could be an example
    # of such as method
    # Link: http://stackoverflow.com/questions/39903444/difference-between-class-method-instance-method-instance-variable-class-va
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

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end




end
