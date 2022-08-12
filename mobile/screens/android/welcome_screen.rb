module Android
  class WelcomeScreen < Appom::Page
    element :no_laucher, :xpath, "//android.widget.LinearLayout[@resource-id='id.jurnal.mobile:id/action_bar_root']/android.widget.FrameLayout[@resource-id='android:id/content']/*"
    element :btn_sign_in, :id, 'btn_sign_in'
    element :btn_sign_up, :id, 'btn_sign_up'
    element :header_signin, :xpath, '//android.view.ViewGroup/android.widget.TextView'
  end
end
