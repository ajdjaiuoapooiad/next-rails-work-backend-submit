class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :salary
      t.string :location

      t.timestamps
    end
  end
end
