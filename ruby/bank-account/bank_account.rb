class BankAccount
  def initialize
    @balance = nil # nil means account is closed
    @mutex = Mutex.new
  end

  def open
    @mutex.synchronize do
      raise ArgumentError, "You can't open an already open account" unless @balance.nil?

      @balance = 0
    end
  end

  def balance
    @mutex.synchronize do
      raise ArgumentError, "You can't check the balance of a closed account" if @balance.nil?

      @balance
    end
  end

  def close
    @mutex.synchronize do
      raise ArgumentError, "You can't close an already closed account" if @balance.nil?

      @balance = nil
    end
  end

  def deposit(amount)
    @mutex.synchronize do
      raise ArgumentError, "You can't deposit money into a closed account" if @balance.nil?
      raise ArgumentError, "You can't deposit a negative amount" if amount.negative?

      @balance += amount
    end
  end

  def withdraw(amount)
    @mutex.synchronize do
      raise ArgumentError, "You can't withdraw money into a closed account" if @balance.nil?

      raise ArgumentError, "You can't withdraw a negative amount" if amount.negative?
      raise ArgumentError, "You can't withdraw more than you have" if amount > @balance

      @balance -= amount
    end
  end
end
