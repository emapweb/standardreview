class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :com_recs do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :projects, :com_rec_id, :integer
    remove_column :projects, :com_rec

    add_index :projects, [:com_rec_id]
  end

  def self.down
    remove_column :projects, :com_rec_id
    add_column :projects, :com_rec, :string

    drop_table :com_recs

    remove_index :projects, :name => :index_projects_on_com_rec_id rescue ActiveRecord::StatementInvalid
  end
end
