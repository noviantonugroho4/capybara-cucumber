module Ios
  class SideMenuScreen < Appom::Page
    element :dashboard_menu, :predicate, 'label == "Dashboard"'
    element :reports_menu, :predicate, 'label == "Reports"'
    element :cash_and_bank_menu, :predicate, 'label == "Cash & Bank"'
    element :sales_menu, :predicate, 'label == "Sales"'
    element :purchases_menu, :predicate, 'label == "Purchases"'
    element :expenses_menu, :predicate, 'label == "Expenses"'
    element :contacts_menu, :predicate, 'label == "Contacts"'
    element :products_menu, :predicate, 'label == "Products"'
    element :open_side_menu, :accessibility_id, 'BurgerMenu'
    element :btn_hamburger_menu, :accessibility_id, 'BurgerMenu'
  end
end
