class AddConsentToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :consent, :text
  end
end
