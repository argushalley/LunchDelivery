# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Define the primary navigation
  navigation.items do |primary|
    # Account menu
    primary.item :account, 'Conta', icon: 'glyphicon glyphicon-user' do |sub|
      sub.item :login, 'Login', new_user_session_path, icon: 'glyphicon glyphicon-log-in', :unless => lambda { user_signed_in? }
      sub.item :logout, 'Logout', destroy_user_session_path, icon: 'glyphicon glyphicon-log-out', :if => lambda { user_signed_in? }
      sub.item :my_data, 'Meus dados', edit_user_registration_path, icon: 'fa fa-suitcase', :if => lambda { user_signed_in? }
    end

    # Admin Meat menu
    primary.item :meats, 'Carnes', icon: 'fa fa-cc-visa', :if => lambda { user_signed_in? && current_user.admin? } do |sub|
      sub.item :index, 'Listar', admin_meats_path, icon: 'glyphicon glyphicon-th-list'
      sub.item :creare, 'Cadastrar', new_admin_meat_path, icon: 'fa fa-credit-card'
    end

    # Admin Side Dish menu
    primary.item :meats, 'Acompanhamentos', icon: 'fa fa-cc-visa', :if => lambda { user_signed_in? && current_user.admin? } do |sub|
      sub.item :index, 'Listar', admin_side_dishes_path, icon: 'glyphicon glyphicon-th-list'
      sub.item :creare, 'Cadastrar', new_admin_side_dish_path, icon: 'fa fa-credit-card'
    end

    # Admin Orders menu
    primary.item :meats, 'Pedidos', icon: 'fa fa-cc-visa', :if => lambda { user_signed_in? } do |sub|
      sub.item :index, 'Listar', admin_orders_path, icon: 'glyphicon glyphicon-th-list', :if => lambda { current_user.admin? }
      sub.item :creare, 'Cadastrar', new_admin_order_path, icon: 'fa fa-credit-card', :if => lambda { current_user.admin? }
      sub.item :creare, 'Cadastrar', new_order_path, icon: 'fa fa-credit-card', :unless => lambda { current_user.admin? }
    end

    primary.dom_id = 'menu-root'
    primary.dom_class = 'nav navbar-nav'
  end
end
