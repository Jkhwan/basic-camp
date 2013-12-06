class CreateDailyRebillers < ActiveRecord::Migration
  def change
    create_table :daily_rebillers do |t|

      t.timestamps
    end
  end
end
