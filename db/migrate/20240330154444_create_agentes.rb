class CreateAgentes < ActiveRecord::Migration[7.1]
  def change
    create_table :agentes do |t|
      t.string :agen_nombre

      t.timestamps
    end
  end
end
