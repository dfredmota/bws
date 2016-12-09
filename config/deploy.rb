# encoding: utf-8
##############################################
##### CONFIGURACOES GLOBAIS DA APLICACAO #####
usr               = nil
# Nome da aplicacao
@@application      = "bws_mobile"
# Repositório git
@@repository       = "bws_mobile"

##############################################
#####     CONFIGURACOES HOMOLOGACAO      #####
# usuário do servidor de homologacao

@@user_homologacao = ""
# endereço no servidor de homologacao onde a app irá ficar
@@deploy_to_homologacao = "/var/www/rails/#{@@application}"
# ip do servidor de homologacao
@@role_homologacao = "162.243.196.32"


#############################################

##############################################
#####      CONFIGURACOES PRODUCAO        #####
# usuário do servidor de producao
@@user_producao = ""
# endereço no servidor de producao onde a app irá ficar
@@deploy_to_url = "/var/www/rails/#{@@application}"
# ip do servidor de producao
@@role_producao = "107.170.29.107"

#############################################

def deploy(usr, usr_git, branch, deploy)
  # Nome da aplicacao
  set :application, @@application
  # set :ssh_options, { :port => 2323 }
  default_run_options[:pty] = true
  ssh_options[:forward_agent] = true
  # ssh_options[:port] = 2221
  # set :bundle_flags, "--quiet --no-cache"
  # set :default_shell, '/bin/bash -i'
  default_run_options[:shell] = '/bin/bash --login -i'
  default_run_options[:on_no_matching_servers] = :continue
  # IMPORTANT = 0
  # INFO      = 1
  # DEBUG     = 2
  # TRACE     = 3
  # MAX_LEVEL = 3
  logger.level = 3

  set :repository, "https://#{usr_git}@bitbucket.org/danielmoliveira/#{@@repository}.git"
  set :scm, :git
  set :user, usr
  set :use_sudo, false
  set :deploy_via, :copy
  set :copy_exclude, [ "**/.git", ".svn/*", "/coverage/**" ]

  set :keep_releases, 5

  after "deploy:update", "deploy:cleanup", "deploy:create_symlink"

  if deploy.downcase == 'homologacao'
    @@environment = "development"
    set :homologacao, true
    set :user, usr
    set :deploy_to, @@deploy_to_url
    set :branch, branch.downcase
    role :app, @@role_homologacao

    puts "*** Deploy da aplicacao \033[1;32m #{@@application.upcase}\033[0m sendo feito em \033[1;41m #{branch.upcase}(#{@@role_homologacao}) \033[0m com o BRANCH \033[1;32m #{branch.upcase} ! \033[0m"
  end

  if deploy.downcase == 'producao'
    @@environment = "production"
    set :producao, true
    set :user, usr
    set :deploy_to, @@deploy_to_url
    set :branch, branch.downcase
    role :app, @@role_producao
    puts "*** Deploy da aplicacao \033[1;32m #{@@application.upcase}\033[0m sendo feito em \033[1;41m #{branch.upcase}(#{@@role_producao}) \033[0m com o BRANCH \033[1;32m #{branch.upcase} ! \033[0m"

  end


  namespace :deploy do

    task :migrate_database do
      p "===> RODANDO MIGRATIONS em #{@@environment} <==="
       run_locally "bundle exec rake db:migrate RAILS_ENV=#{@@environment}"
      p "================================================"
    end

    task :configs do
      desc "===> RODANDO WHENEVER, PRECOMPILE E RESTART DA APLICACAO EM #{@@environment} <==="
      if branch.downcase == 'master'
        run "cd #{current_path} && bundle install --local --without=development test"
        run "cd #{current_path} && rake assets:precompile"
      else
        run "cd #{current_path} && bundle install --local --without=test"
      end
    end

    task :restart, :except=>{:no_release => true} do
      desc "Restartando a aplicacao"
      run "touch #{current_path}/tmp/restart.txt"
    end
  end

  # before 'deploy', 'deploy:migrate_database' if @environment == 'production'
  # after  'deploy', 'deploy:configs'

end

###################################################################
# TELA PARA FACILITAR O DEPLOY
###################################################################

def header
  puts "\033[1;32m----------------------------------------------------------"
            puts "|      PROMPT PARA DEPLOY DE APPS USANDO CAPISTRANO      |"
            puts "|                 (Control C para sair)                  |"
            puts "----------------------------------------------------------\033[0m"
end

def tela_prompt

  system "clear"

  usr,usr_git,branch,deploy,opcao = ""

  while (usr.eql?("") || deploy.eql?(""))

    header
    puts "\033[1;36m DIGITE SEU USUARIO DO GIT\033[0m"
    puts "\033[1;36m 1 - danielmoliveira\033[0m"
    puts "\033[1;36m ou apenas informe o usuário: \033[0m"
    usr_git = STDIN.gets.chomp
    usr_git = (usr_git.eql? '1') ? 'danielmoliveira' :  usr_git
    system "clear"

    header
    puts "\033[1;36m DIGITE SEU USUARIO DO SSH\033[0m"
    puts "\033[1;36m 1 - rails\033[0m"
    puts "\033[1;36m ou apenas informe o usuário: \033[0m"
    usr = STDIN.gets.chomp
    usr = (usr.eql? '1') ? 'rails' :  usr
    system "clear"

    header
    puts "\033[1;36m QUAL BRANCH DESEJA FAZER DEPLOY? \033[0m"
    puts "\033[1;33m 1 - HOMOLOGACAO \033[0m"
    puts "\033[1;33m 0 - MASTER \033[0m"
    puts "\033[1;36m OU DIGITE O NOME DE OUTRO BRANCH \033[0m"
    branch = STDIN.gets.chomp.upcase
    branch = (branch.eql? '0') ? 'master' : ((branch.eql? '1') ? 'homologacao' : branch)
    system "clear"

    header
    puts "\033[1;36m DIGITE O AMBIENTE PARA DEPLOY:"
    puts "\033[1;33m 1 - HOMOLOGACAO \033[0m"
    puts "\033[1;33m 0 - PRODUCAO \033[0m"
    deploy = STDIN.gets.chomp.upcase
    deploy = (deploy.eql? '0') ? 'producao' : ((deploy.eql? '1') ? 'homologacao' : deploy)
    system "clear"

    if usr.eql?("") || deploy.eql?("") || branch.eql?("")
      system "clear"
      puts "\033[1;31m !!! DADOS EM BRANCO !!! \033[0m"
      sleep(3)
      system "clear"
    else
      system "clear"
      puts "\033[1;36m *---------------------------------------------------------------*"
     puts "|\033[0m \033[1;33m        O DEPLOY SERA FEITO COM OS SEGUINTES DADOS:            \033[0m
                                                                                             \033[1;36m|
                                                                                             \033[0m"
      puts "\033[1;36m *---------------------------------------------------------------*     \033[0m"
      puts "\033[1;36m  * USUARIO GITLAB: #{usr}                                             \033[0m"
      puts "\033[1;36m  * COM O BRANCH: #{branch.upcase}                                     \033[0m"
      puts "\033[1;36m  * NO AMBIENTE: #{deploy.upcase}                                      \033[0m"
      puts "\033[1;36m *---------------------------------------------------------------*     \033[0m"
      puts "\033[1;32m        Deseja realizar deploy com essas informacoes? [S,N]            \033[0m"
      opcao = STDIN.gets.chomp

      if opcao.upcase == "S"
        system "clear"
        deploy(usr, usr_git, branch, deploy)
      else
        p "Processo abortado!"
        usr,branch = ""
        system "clear"
      end

    end

  end

end

tela_prompt


