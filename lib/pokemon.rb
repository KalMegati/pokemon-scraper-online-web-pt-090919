class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(dex)
    @id = dex[:id]
    @name = dex[:name]
    @type = dex[:type]
    @db = dex[:db]
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    pokerow = db.execute(sql, id)[0]
    pokehash = {
      id: pokerow[0],
      name: pokerow[1],
      type: pokerow[2],
      db: db
    }
    Pokemon.new(pokehash)
  end
  
end
