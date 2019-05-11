class ChangeColumnTypeToApps < ActiveRecord::Migration[5.2]
  def change
    change_table :apps do |t|
      t.change :description, :text
    end
  end
end
