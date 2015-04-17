class AddViewedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :viewed, :integer, null: false, default: 0
  end
end
