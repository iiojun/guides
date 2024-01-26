class AddConsent2ToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :consent2, :text
  end
end
