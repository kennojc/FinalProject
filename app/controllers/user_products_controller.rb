class UserProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :paypal_init, :except => [:index]

    def index
    end

    def create_order
        final_price = '100'
        request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
        request.request_body({
     :intent => 'CAPTURE',
     :purchase_units => [
          {
           :amount => {
           :currency_code => 'USD',
           :value => final_price
        }
      }
    ]
  })
    begin
      response = @client.execute(request)
      user_product = UserProduct.new
      user_product.final_price = final_price.to_i
      user_product.token = response.result.id
    if user_product.save
        return render :json => {:token => response.result.id}, :status => :ok
    end
  
    rescue PayPalHttp::HttpError => ioe
    # HANDLE THE ERROR
    end

    end

    def capture_order
        request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new(params[:user_products_id])
  
        begin
            response = @client.execute(request)
            order = UserProduct.find_by :token => params[:user_products_id]
            order.paid = response.result.status == 'COMPLETED'
        
            if order.save
                return render :json => {:status => response.result.status}, :status => :ok
            end
        rescue PayPalHttp::HttpError => ioe
        # HANDLE THE ERROR
        end
    end

    private

    def paypal_init
        client_id = 'ASUGDgN0Vq5gQB00y1ivnVLYHPnySGTtql26GK6iihRT1cxYym-lbVguuYgP6b3q-nIT3akKItk2ogJs'
        client_secret = 'YEKu7DT2VaYEbb323aYO0X-W70ySv_pONYhN64eJosXma8GPMIgoOhxrZysBVUo-jpRX2IKVmA48siBUP'
        environment = PayPal::SandboxEnvironment.new client_id, client_secret
        @client = PayPal::PayPalHttpClient.new environment
    end

end
