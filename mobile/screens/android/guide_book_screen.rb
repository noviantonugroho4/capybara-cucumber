module Android
  class GuideBookScreen < Appom::Page
    element :input_search_guide_book, :xpath, "(//android.widget.EditText[@resource-id='search_query_query'])[0]"
  end
end
