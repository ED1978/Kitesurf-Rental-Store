require_relative('../db/sql_runner.rb')

class StockItem

  attr_reader :id, :name, :category, :size

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @category = options['category']
    @size = options['size']
  end

  def save()
    sql = "INSERT INTO stock_items (name, category, size)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @category, @size]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM stock_items"
    stock_items = SqlRunner.run(sql)
    return stock_items.map {|stock_item| StockItem.new(stock_item)}
  end

end
