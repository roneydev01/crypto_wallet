# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Criando Moedas...", format: :pulse_2)
spinner.auto_spin

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
  Coin.find_or_create_by!(coin)
end

spinner.success("Moedas criadas com sucesso!")