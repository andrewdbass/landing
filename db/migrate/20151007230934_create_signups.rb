class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.string :link
      t.string :referral
      t.integer :referred, :default => 0

      t.timestamps null: false
    end
  end
end
