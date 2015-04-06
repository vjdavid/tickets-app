class AddProjectIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :proyect_id, :integer
  end
end
