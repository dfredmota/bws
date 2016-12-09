# README #

Aplicação Rails 4.2.5.1, Ruby 2.2.1 com templates personalizados e controle de usuários e perfis.

### Quais gems utilizadas para controle de usuáio? ###

* devise
* cancan

### Como personalizar os templates? ###

* **Views:** lib/templates/erb/scaffold/
* **Controller:** deverá sobrescrever o generator e adicionar template com nome personalizado:
 - Generator: lib/generators/scaffold_controller/scaffold_controller_generator.rb
 - Controller template: lib/templates/rails/scaffold_controller/custom_controller.rb
# bws
# bws
