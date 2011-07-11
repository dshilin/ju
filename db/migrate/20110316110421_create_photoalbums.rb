class CreatePhotoalbums < ActiveRecord::Migration
  def self.up
    create_table :photoalbums do |t|
      t.column :name,               :string
      t.timestamps
    end
  end

  def self.down
    drop_table :photoalbums
  end
end
