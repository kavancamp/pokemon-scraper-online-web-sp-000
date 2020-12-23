class Pokemon
  attr_reader :id, :name, :type, :db


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

 def self.save(name, type, db)
   sql = <<-SQL
      INSERT INTO pokemon (name, type)VALUES (?, ? );
    SQL

    db.execute(sql, [name, type])

 end

 def self.find(id, db)
    SELECT * FROM pokemon WHERE id = (?);
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id, pokemon[1], pokemon[2], pokemon[3], db)

  end


end
