class ChangeRefferdColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default(:signups, :referred, 0)
  end
end
