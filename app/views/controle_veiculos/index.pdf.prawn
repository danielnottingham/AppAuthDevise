prawn_document do |pdf|
  pdf.text 'Controle Entrada e Saida de veículos', align: :center, size: 24
  pdf.move_down 20
  
  pdf.table(@controle_veiculos.map { |p| [p.id, p.motorista, p.placa, p.obs, p.entrada.strftime("%d/%b/%Y - %H:%M"), p.saida.strftime("%d/%b/%Y - %H:%M")] })
end