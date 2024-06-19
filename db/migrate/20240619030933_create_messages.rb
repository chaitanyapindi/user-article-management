class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :to
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
