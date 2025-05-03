class CreateJobRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :job_roles do |t|
      t.string :industry
      t.string :role
      t.string :literature_ok
      t.text :traits
      t.text :note
      t.text :extraversion_text
      t.text :rational_text
      t.text :decisive_text
      t.text :creative_text
      t.text :plan_text
      t.text :leader_text
      t.text :realistic_text
      t.text :disciplined_text

      t.timestamps
    end
  end
end
