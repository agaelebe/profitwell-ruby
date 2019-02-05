class Profitwell::Client
  module TransactionDetail

    def transaction_detail(user_id)
      transaction_detail = connection.get("transactions/user/#{user_id}/")
      parse_response(transaction_detail)
    end

    def update_subscription(user_id, plan_name, plan_interval, plan_value, start_date)
      data = {
          'plan_name' => plan_name,
          'plan_interval' => plan_interval,
          'plan_value' => plan_value,
          'start_date' => start_date
      }
      update_response = connection.post("transactions/user/#{user_id}/") do |req|
        req.body = data.to_json
      end
      parse_response(update_response)
    end

    def delete_user(user_id)
      delete_user_response = connection.delete("transactions/user/#{user_id}/")
      parse_response(delete_user_response)
    end

  end
end

