class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :introduction
      t.text :skills
      t.string :company_name
      t.string :industry

      t.timestamps
    end
  end
end
