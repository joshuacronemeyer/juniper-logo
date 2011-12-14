class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.text :json
      t.string :title
      t.timestamps
    end
  end
end
