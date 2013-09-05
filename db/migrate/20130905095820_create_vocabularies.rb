class CreateVocabularies < ActiveRecord::Migration
  def change
    create_table :vocabularies do |t|
      t.string :title
      t.references :project, index: true

      t.timestamps
    end
  end
end
