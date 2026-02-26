class CreateTasks < ActiveRecord::Migration[8.1]

  def change
    create_table :tasks do |t|
      t.string     :description
      t.belongs_to :user
      t.boolean    :completed, null: false, default: false

      t.timestamps
    end
  end

end
