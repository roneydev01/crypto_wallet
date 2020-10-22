namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spnner("Apagando BD..."){ %x(rails db:drop)}
      show_spnner("Criando BD..."){ %x(rails db:create)}
      show_spnner("Migrando BD..."){ %x(rails db:migrate)}
      %x(rails dev:add_coins)    
    else
      puts "Ação não realizada. Verifique se você esta no ambiente de desenvolvimeto."
    end
  end

  desc "Cadastra Moedas"
  task add_coins: :environment do
    show_spnner("Cadastradando Moedas...") do
      coins = (
        [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"
            
          },

          {
            description: "Ethereum",
            acronym: "ETH",
            url_image:"https://img2.gratispng.com/20180516/vgq/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9e70b61.4199610615265041219464.jpg"
          }
        ]
      )

      coins.each do |coin|
        sleep(1)
        #Se já existir não cria novamente
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  private

  def show_spnner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :pulse_2)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
