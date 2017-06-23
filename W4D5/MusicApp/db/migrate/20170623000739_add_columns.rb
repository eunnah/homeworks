class AddColumns < ActiveRecord::Migration
  def change
    add_column :albums, :category, :string, null: false
    add_column :tracks, :category, :string, null: false
    add_column :tracks, :lyrics, :text
  end
end
