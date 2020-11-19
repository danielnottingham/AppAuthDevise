FactoryBot.define do
  factory :controle_veiculo do
    motorista { 'Miguel' }
    placa { 'PQP-3245' }
    entrada { nil }
    saida { nil }
    obs { 'Observação' }
  end
end
