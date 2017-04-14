class Account
  attr_reader :sum

  def initialize(owner, sum)
    @owner = owner
    @sum = sum
  end

  def transfer(recipient, sum)
    raise "Not enough money" if @sum - sum < 0
    @sum -= sum
    recipient.take_money(sum)
  end

  def take_money(sum)
    @sum += sum
  end

  # def reset
  #   @sum = 0
  # end

  # alias add_money take_money

  def init_sum(sum)
    @sum = sum
  end
end
