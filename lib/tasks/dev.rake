namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando BD...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success('(Concluído com sucesso!)')

      spinner = TTY::Spinner.new("[:spinner] Criando BD...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:create)
      spinner.success('(Concluído com sucesso!)')

      spinner = TTY::Spinner.new("[:spinner] Migrando BD...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success('(Concluído com sucesso!)')

      spinner = TTY::Spinner.new("[:spinner] Populando BD...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success('(Setup concluído com sucesso!)')      
    else
      puts "Ação não realizada. Verifique se você esta no ambiente de desenvolvimeto."
    end
  end
end
