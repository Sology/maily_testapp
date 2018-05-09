# This migration comes from maily_herald (originally 20171030081113)
class AddKindToMailyHeraldDispatches < ActiveRecord::Migration[4.2]
  def change
    add_column :maily_herald_dispatches, :kind, :integer, default: 0, null: false
  end
end
