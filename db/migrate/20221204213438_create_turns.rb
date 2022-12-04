class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.timestamp :date
      t.text :motive
      t.integer :state
      t.text :result
      t.belongs_to :subsidiary , index: true
      t.belongs_to :client , class_name: 'User' , index:true , null:true
      t.belongs_to :staff , class_name: 'User' , index:true  ,null:true

      t.timestamps
    end
  end
end
