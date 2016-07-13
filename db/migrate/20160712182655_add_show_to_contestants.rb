class AddShowToContestants < ActiveRecord::Migration
  def change
    add_reference :contestants, :show, index: true, foreign_key: true
  end
end
