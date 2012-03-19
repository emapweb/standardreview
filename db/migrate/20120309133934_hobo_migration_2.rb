class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :projects, :date, :date
    add_column :projects, :phone, :string
    add_column :projects, :organization, :string
    add_column :projects, :email, :string
    add_column :projects, :address, :string
    add_column :projects, :city, :string
    add_column :projects, :zip, :string
    add_column :projects, :com_rec, :string
    add_column :projects, :comment, :text
    add_column :projects, :support, :text
    add_column :projects, :signature, :string
    add_column :projects, :rop_email, :string
    add_column :projects, :state_id, :integer

    add_index :projects, [:state_id]
  end

  def self.down
    remove_column :projects, :date
    remove_column :projects, :phone
    remove_column :projects, :organization
    remove_column :projects, :email
    remove_column :projects, :address
    remove_column :projects, :city
    remove_column :projects, :zip
    remove_column :projects, :com_rec
    remove_column :projects, :comment
    remove_column :projects, :support
    remove_column :projects, :signature
    remove_column :projects, :rop_email
    remove_column :projects, :state_id

    remove_index :projects, :name => :index_projects_on_state_id rescue ActiveRecord::StatementInvalid
  end
end
