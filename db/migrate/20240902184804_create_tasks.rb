# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :sub_title
      t.datetime :due_date
      t.integer :priority, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
