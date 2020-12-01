prawn_document do |pdf|
  pdf.text 'Controle da Portaria', align: :center, size: 24
  pdf.move_down 20
  
  pdf.table(@controle_portaria.map { |p| [p.id,p.nome, p.documento, p.empresa, p.placa, p.entrada.strftime("%d/%m/%Y - %H:%M"), p.saida.strftime("%d/%m/%Y - %H:%M"), p.obs] })
end