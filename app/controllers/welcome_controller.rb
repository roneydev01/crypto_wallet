class WelcomeController < ApplicationController
  def index
    #Variaveis de instância
    @meu_nome = params[:nome]
  end
end
