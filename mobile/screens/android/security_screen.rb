module Android
  class SecurityScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :tgl_pin, :id, 's_pin'
    element :dd_timeout_interval, :id, 'tv_timeout_interval'
    element :txt_payment_method, :id, 'tvTransactionDate'
    element :txt_transaction_date, :id, 'tvDueDate'
    element :txt_deposit_to, :id, 'tvTerm'
    element :txt_payment_amount, :id, 'tvTotalAmountVertical'
    elements :btn_keypad, :id, 'iv_keypad_btn'
    element :btn_cancel, :id, 'android:id/button2'
    element :confirm_pin_screen, :xpath, "//android.widget.TextView[@text='Confirm PIN']"
    element :text_pin_warning, :id, 'tv_pin_warning'
    element :btn_forgot_pin, :id, 'tv_forgot_pin'

    def list_timeout(timeout = '1 Minute')
      $driver.find_element(:xpath, "//android.widget.TextView[@text='#{timeout}']/following-sibling::android.widget.RadioButton")
    end

    def key_pad_num(num)
      $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tv_keypad_btn' and @text = #{num}]")
    end

    def sett_pin(details)
      if tgl_pin['checked'] != details['pin'].to_s
        tgl_pin.click
        wait_for { has_btn_keypad? }
        input_pin details['pin_number'].to_s
        wait_for { has_confirm_pin_screen? }
        input_pin details['confim_pin_number'].to_s
        if details['pin_number'].to_s != details['confim_pin_number'].to_s
          expect(text_pin_warning.text).to include 'do not match'
          $driver.back
          sleep 1
        end
        wait_for { has_tgl_pin? }
      elsif (tgl_pin['checked'].eql? 'false') && (details['pin'].to_s.eql? 'false')
        tgl_pin.click
        wait_for { has_btn_keypad? }
        $driver.back
        wait_for { has_tgl_pin? }
        expect(tgl_pin['checked']).to eq 'false'
      end
      select_interval details['interval'] unless details['interval'].nil?
    end

    def input_pin(pin_num)
      pin_num.split('').each do |num|
        key_pad_num(num).click
        sleep 1
      end
    end

    def select_interval(timeout)
      dd_timeout_interval.click
      wait_for { list_timeout.displayed? }
      list_timeout(timeout).click
      wait_for { has_tgl_pin? }
    end
  end
end
