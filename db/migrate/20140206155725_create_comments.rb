class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :applicant, index: true

      t.timestamps
    end
  end
end
