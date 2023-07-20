class CreateJoinTableExpenceGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expences, :groups do |t|
      t.index [:expence_id, :group_id]
      t.index [:group_id, :expence_id]
    end
  end
end
