require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    if hp != nil
      @hp = hp
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_mon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: new_mon[0], name: new_mon[1], type: new_mon[2], db: db, hp: new_mon[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
