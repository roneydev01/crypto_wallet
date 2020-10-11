module ApplicationHelper
  #Converte data para padrão BR
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def ambiente
    if Rails.env.development? 
      "Desenvolvimento"
    elsif Reils.env.production?
      "Produção"
    else
      "Teste"
    end
  end

  def idioma
    I18n.locale == :en ? "Estados Unidos" : "Português do Brasil"
  end
end
