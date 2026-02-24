class CreateTasks < ActiveRecord::Migration[8.1]

  def change
    create_table :tasks do |t|
      t.string     :title
      t.belongs_to :users
      t.datetime   :due_at
      t.boolean    :completed, null: false, default: false

      t.timestamps
    end
  end

end
