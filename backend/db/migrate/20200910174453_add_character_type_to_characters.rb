class AddCharacterTypeToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :character_type, :string
  end
end
