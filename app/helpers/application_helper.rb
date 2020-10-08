module ApplicationHelper
  #Converte data para padrão BR
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end
end
