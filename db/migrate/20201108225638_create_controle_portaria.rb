class CreateControlePortaria < ActiveRecord::Migration[6.0]
  def change
    create_table :controle_portaria do |t|
      t.string :nome
      t.string :documento
      t.string :empresa
      t.string :placa
      t.timestamp :entrada
      t.timestamp :saida
      t.text :obs

      t.timestamps
    end
  end
end
