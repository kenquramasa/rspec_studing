class CreateCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :codes do |t|
      t.string :raw_code, null: false

      t.timestamps
    end
  end
end
