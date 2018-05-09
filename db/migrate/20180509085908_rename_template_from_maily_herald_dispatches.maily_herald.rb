# This migration comes from maily_herald (originally 20171030074629)
class RenameTemplateFromMailyHeraldDispatches < ActiveRecord::Migration[4.2]
  def change
    rename_column :maily_herald_dispatches, :template, :template_plain
  end
end
