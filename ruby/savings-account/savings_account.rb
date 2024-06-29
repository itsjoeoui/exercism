module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(_balance)
    interest_rate(_balance) * _balance / 100.0 + _balance
  end

  def self.years_before_desired_balance(_current_balance, _desired_balance)
    years = 0

    until _current_balance >= _desired_balance
      _current_balance = annual_balance_update(_current_balance)
      years += 1
    end

    years
  end
end
