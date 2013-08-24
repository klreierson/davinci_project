class InitialSchema < ActiveRecord::Migration
  def up
  create_table :profile do |t|
    t.string :first_name
    t.string :last_name
    t.string :city
    t.string :state
    t.string :country
    t.string :trading_style
    t.string :fav_sector
    end

  create_table :company do |t|
    t.string :symbol
    t.string :name
    t.string :sector
    end
  end

  def down
    drop_table :profile
    drop_table :company
  end
end
