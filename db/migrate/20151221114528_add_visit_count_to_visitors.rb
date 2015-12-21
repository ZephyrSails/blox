class AddVisitCountToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :visit_count, :integer
  end
end
