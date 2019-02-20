class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.string :location
      t.string :date
      t.string :time
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
