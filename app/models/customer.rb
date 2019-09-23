require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @dob = options['dob']
  end

  def save()
    sql = "INSERT INTO customers (name, address, dob)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @address, @dob]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers
    SET (name, address, dob)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @address, @dob, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map {|customer| Customer.new(customer)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql, values)
    result = Customer.new(customer.first)
    return result
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new( customer ) }
    return result
  end

end
