class CreateLoggeraErrors < ActiveRecord::Migration[7.0]
  def change
    create_table :loggera_errors do |t|
      t.string :title
      t.string :class_name
      t.string :message
      t.string :backtrace
      t.integer :status
      t.string :params
      t.string :path
      t.string :http_method
      t.string :format

      t.timestamps
    end
  end
end
