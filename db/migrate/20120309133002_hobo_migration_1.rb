class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :standard_id
      t.integer  :area_id
    end
    add_index :projects, [:standard_id]
    add_index :projects, [:area_id]

    create_table :standards do |t|
      t.string   :name
      t.string   :number
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :areas do |t|
      t.string   :name
      t.string   :num
      t.text     :language
      t.text     :overview
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :standard_id
    end
    add_index :areas, [:standard_id]

    create_table :states do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :projects
    drop_table :standards
    drop_table :areas
    drop_table :states
  end
end
