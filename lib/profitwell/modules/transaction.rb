class Profitwell::Client
  module Transaction

    def transactions
      transactions = connection.get('transactions/')
      parse_response(transactions)
    end

    def new_customer(email, plan_name, plan_interval, plan_value, start_date, options={})
      data = {
          'email' => email,
          'plan_name' => plan_name,
          'plan_interval' => plan_interval,
          'plan_value' => plan_value,
          'start_date' => start_date
      }
      data['currency'] = options['currency'] unless options['currency'].nil?
      data['end_date'] = options['end_date'] unless options['end_date'].nil?
      customer = connection.post('transactions/') do |req|
        req.body = data.to_json
      end
      parse_response(customer)
    end
  end
end
