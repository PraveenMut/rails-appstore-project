class AddBlurbToApps < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :blurb, :string
  end
end
