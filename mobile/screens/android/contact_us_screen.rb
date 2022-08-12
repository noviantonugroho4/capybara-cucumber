module Android
  class ContactUsScreen < Appom::Page
    element :text_to, :id, 'com.google.android.gm:id/to'
    element :text_cc, :id, 'com.google.android.gm:id/cc'
  end
end
