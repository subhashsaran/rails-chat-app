class CreateComentReplies < ActiveRecord::Migration
  def change
    create_table :coment_replies do |t|
      t.string :content
      t.belongs_to :coment , index:true
      # t.integer :coment_id

      t.timestamps
    end
  end
end
