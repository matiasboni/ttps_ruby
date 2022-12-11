class BussinessHours < ActiveRecord::Migration[7.0]
  def change
    create_table :bussiness_hours do |t|
      t.integer :day
      t.time :opening_time
      t.time :closing_time
      t.belongs_to :subsidiary, index: true
    end

    create_table :bussiness_hours_subsidiaries, id: false do |t|
      t.belongs_to :subsidiary, index: true
      t.belongs_to :bussiness_hour, index: true
    end
  end
end
