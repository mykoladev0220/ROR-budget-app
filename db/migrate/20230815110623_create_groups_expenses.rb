class CreateGroupsExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_expenses, id: false do |t|
      t.references :group, foreign_key: true
      t.references :expense, foreign_key: true

      t.timestamps
    end
    add_index :groups_expenses, [:group_id, :expense_id], unique: true
  end
end
