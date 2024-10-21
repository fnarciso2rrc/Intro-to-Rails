class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :main_breed
      t.string :sub_breed
      t.string :dog_name

      t.timestamps
    end
  end
end
