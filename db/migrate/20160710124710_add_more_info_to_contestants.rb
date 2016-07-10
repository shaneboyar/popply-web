class AddMoreInfoToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :age, :integer
    add_column :contestants, :occupation, :string
  end
end
