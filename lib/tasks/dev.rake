namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spnner("Apagando BD..."){ %x(rails db:drop)}
      show_spnner("Criando BD..."){ %x(rails db:create)}
      show_spnner("Migrando BD..."){ %x(rails db:migrate)}
      show_spnner("Populando BD..."){%x(rails db:seed)}    
    else
      puts "Ação não realizada. Verifique se você esta no ambiente de desenvolvimeto."
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
