prawn_document do |pdf|
  pdf.text 'Controle Entrada e Saida de veículos', :align => :center, :size => 24
  pdf.move_down 20
  pdf.table @controle_veiculos.collect{|p| [p.id,p.motorista,p.placa,p.obs]}
end