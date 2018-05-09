# This migration comes from maily_herald (originally 20171107081534)
class TweakMailyHeraldLogs < ActiveRecord::Migration[4.2]
  def change
    add_column :maily_herald_logs, :token, :string
  end
end
