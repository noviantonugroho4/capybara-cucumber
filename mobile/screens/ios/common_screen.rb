module Ios
  class CommonScreen < Appom::Page
    element :datepicker, :id, 'datePicker'
    element :action_bar_root, :id, 'id.jurnal.mobile:id/action_bar_root'
    element :content, :id, 'android:id/content'
    elements :inside_application, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]'
    element :text_toast_message, :xpath, '//android.widget.Toast'
    element :btn_back, :accessibility_id, 'ic back white'
  end
end
