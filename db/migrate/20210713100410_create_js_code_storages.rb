class CreateJsCodeStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :js_code_storages do |t|
      t.string :js_code

      t.timestamps
    end
  end
end
