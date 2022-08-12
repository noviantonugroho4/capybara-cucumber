module Android
  class CommonScreens < Appom::Page
    element :datepicker, :id, 'datePicker'
    element :action_bar_root, :id, 'id.jurnal.mobile:id/action_bar_root'
    element :content, :id, 'android:id/content'
    elements :inside_application, :xpath, '//android.widget.TextView[@name="Jurnal Mobile"]'
    element :text_toast_message, :xpath, '//android.widget.Toast'
    element :btn_back, :accessibility_id, 'ic back white'
  end
end
