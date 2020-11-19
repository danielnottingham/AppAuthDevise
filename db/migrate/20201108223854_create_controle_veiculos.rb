class CreateControleVeiculos < ActiveRecord::Migration[6.0]
  def change
    create_table :controle_veiculos do |t|
      t.string :motorista
      t.string :placa
      t.timestamp :entrada
      t.timestamp :saida
      t.text :obs

      t.timestamps
    end
  end
end
