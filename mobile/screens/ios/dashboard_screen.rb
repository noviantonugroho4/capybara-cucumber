module Ios
  class DashboardScreen < Appom::Page
    element :popup_feedback, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_close_feedback, :accessibility_id, 'Close'
    element :txt_business_overview, :xpath, '(//XCUIElementTypeStaticText[@name="Business Overview"])[1]'
    element :logo_jurnal_mobile, :accessibility_id, 'DashboardView'
    element :popup_new_feature, :xpath, '//XCUIElementTypeButton[@name="See feature"]'
    element :btn_close_new_feature, :xpath, '//XCUIElementTypeButton[@name="ic close dark black"]'
    element :popup_survey, :accessibility_id, 'popup_survey'
    element :popup_survey_close, :class_chain, '**/XCUIElementTypeButton[`label == "Close"`]'
    element :btn_onboarding_skip, :xpath, '//XCUIElementTypeButton[@name="Skip"]'
    element :btn_onboarding_next, :xpath, '//XCUIElementTypeButton[@name="Next"]'
  end
end
