class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :salary
      t.integer :company_id
      t.text :requirements
      t.text :benefits
      t.string :employment_type

      t.timestamps
    end
    add_foreign_key :jobs, :users, column: :company_id # 外部キー制約を追加
    add_index :jobs, :company_id # インデックスを追加
  end
end