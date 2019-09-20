require_relative('../db/sql_runner.rb')


class Rental

  attr_reader :id, :customer_id, :stock_item_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @stock_item_id = options['stock_item_id'].to_i()
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, stock_item_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@customer_id, @stock_item_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i()
  end

end
