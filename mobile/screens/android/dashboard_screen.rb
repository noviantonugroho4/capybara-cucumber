module Android
  class DashboardScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :popup_feedback, :id, 'lnExpression'
    element :btn_close_feedback, :id, 'tvFeedbackClose'
    element :txt_business_overview, :id, 'busines'
    element :logo_jurnal_mobile, :accessibility_id, 'Jurnal Mobile'
    element :popup_new_feature, :id, 'btnSeeFeature'
    element :btn_close_new_feature, :id, 'ivClose'
    element :btn_notification, :id, 'iv_notification'
    element :btn_onboarding_skip, :id, 'tvOnboardingSkip'
    element :btn_onboarding_next, :id, 'tvOnboardingNext'
  end
end
