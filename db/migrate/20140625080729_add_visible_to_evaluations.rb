class AddVisibleToEvaluations < ActiveRecord::Migration
  def change
    add_column :code_submission_evaluations, :visible, :boolean, default: false
  end
end
