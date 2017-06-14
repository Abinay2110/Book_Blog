class CreateBviews < ActiveRecord::Migration[5.0]
  def change
    create_table :bviews do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.integer :rating

      t.timestamps
    end
  end
end
