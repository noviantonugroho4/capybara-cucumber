module Android
  class CommonScreen < Appom::Section
    element :datepicker, :id, 'datePicker'
    element :action_bar_root, :id, 'id.jurnal.mobile:id/action_bar_root'
    element :content, :id, 'android:id/content'
    element :btn_back, :id, 'ivBack'
    elements :inside_application, :xpath, '//android.view.ViewGroup[contains(@id, id.jurnal.mobile)]'
    element :text_toast_message, :xpath, '//android.widget.Toast'
    element :progress_bar_loading, :xpath, '//android.widget.ProgressBar'
  end
end
