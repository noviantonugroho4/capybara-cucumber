class ExpenseRequirement
  include DataMagic

  def initialize
    DataMagic.load 'expense.yml'
  end

  def load_expense_details(key)
    data_for "expense/#{key}"
  end
end
