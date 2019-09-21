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

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run( sql, values )
    return Customer.new( results.first )
  end

  def stock_item()
    sql = "SELECT * FROM stock_items
    WHERE id = $1"
    values = [@stock_item_id]
    results = SqlRunner.run( sql, values )
    return StockItem.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    return rentals.map {|rental| Rental.new(rental)}
  end




end
