# This migration comes from maily_herald (originally 20171030081534)
class AddTemplateHtmlToMailyHeraldDispatches < ActiveRecord::Migration[4.2]
  def change
    add_column :maily_herald_dispatches, :template_html, :text
  end
end
