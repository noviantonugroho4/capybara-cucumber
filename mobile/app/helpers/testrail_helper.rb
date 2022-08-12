class TestrailHelper
  attr_reader :file_name, :test_rail_file

  def initialize
    @file_name = Dir.pwd + '/app/configs/test_rail.yml'
    @test_rail_file = YAML.load_file(@file_name)
  end

  def update_testrail_result(arg_run_id, arg_case_ids, arg_status)
    coll_case_ids = sanitize_test_case_id(arg_case_ids.split(','))
    run_results = { "results": [] }
    automated = { 'case_ids' => coll_case_ids, 'custom_automated' => 1 }
    if arg_status.empty? || arg_status.nil? || arg_run_id.to_s.strip.empty? || arg_case_ids.to_s.strip.empty? || arg_status.to_s.strip.empty?
      p 'Specified parameters is not correct, please re-check !'
    else
      coll_case_ids.each do |id|
        if arg_status.casecmp('passed').zero?
          status_id = 1
          comment = 'This scenarios marked as PASSED by ICEBOX'
        elsif arg_status.casecmp('failed').zero?
          status_id = 5
          comment = 'This scenarios marked as FAILED by ICEBOX'
        end
        run_results[:results] << { "case_id": id, 'status_id': status_id, 'comment': comment }
      end
      p 'Updating test run id ' + arg_run_id.to_s
      add_results_uri = 'add_results_for_cases/' + arg_run_id.to_s
      automated_status_uri = 'update_cases/49'
      update_run = send_request(@test_rail_file, add_results_uri, run_results)
      update_automated = send_request(@test_rail_file, automated_status_uri, automated)
      if update_run.code.to_i != 200 || update_automated.code.to_i != 200
        error_log = []
        error_log << update_run.body['error'] if update_run.body['error'].present?
        error_log << update_automated.body['error'] if update_automated.body['error'].present?
        p 'Failed updating result to testrail!!!'
        p "Error log: #{error_log}"
      else
        p "Test case #{coll_case_ids} successfully updated in Testrail"
      end
    end
  rescue Exception => e
    p 'Error Occured in Test Rail Integration, Error Desc is : ' + e.message
  end

  private

  def send_request(credential, endpoint, request_body = nil)
    url = URI(credential['url'].to_s + endpoint)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request.basic_auth credential['user_name'], credential['access_key']
    request['content-type'] = 'application/json'
    request.body = request_body.to_json unless request_body.nil?
    response = http.request(request)
    response.body = JSON.parse(response.read_body) unless response.body.blank?

    response
  end

  def sanitize_test_case_id(test_case_ids)
    filtered_test_case = test_case_ids.select { |test_case| ENV['PLATFORM'].eql?('android') ? test_case.include?('A') : test_case.include?('I') }
    filtered_test_case.collect { |test_case| test_case.gsub!(/[AI]/, '').to_i }
  end
end
