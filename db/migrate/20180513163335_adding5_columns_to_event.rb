class Adding5ColumnsToEvent < ActiveRecord::Migration[5.1]
  def change

    add_column :events, :img_url, :string
    add_column :events, :tagline, :string
    add_column :events, :details1, :text
    add_column :events, :details2, :text
    add_column :events, :foundation_url, :string

  end
end
