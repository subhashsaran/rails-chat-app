class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.string :content
      t.integer :article_id

      t.timestamps
    end
  end
end
