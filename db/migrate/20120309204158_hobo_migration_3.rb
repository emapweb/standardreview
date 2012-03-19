class HoboMigration3 < ActiveRecord::Migration
  def self.up
    remove_column :areas, :num
  end

  def self.down
    add_column :areas, :num, :string
  end
end
