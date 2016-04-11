class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :username
      t.string :name
      t.string :fname
      t.text :address
      t.string :dob
      t.string :contact
      t.string :edu
      t.text :comment

      t.timestamps
    end
  end
end
