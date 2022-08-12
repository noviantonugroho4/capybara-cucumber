module Ios
  class WelcomeScreen < Appom::Page
    element :no_laucher, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther'
    element :btn_sign_in, :xpath, '//XCUIElementTypeButton[@name="Sign in"]'
    element :btn_sign_up, :xpath, '//XCUIElementTypeButton[@name="Sign Up"]'
  end
end
