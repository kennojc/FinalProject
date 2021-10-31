ActiveAdmin.register Product do

  form product: 'A custom title' do |f|
    f.inputs 
    f.inputs "Type" do
      f.input :types, as: :check_boxes
    end
    f.inputs "Auction" do
      f.has_many :auctions do |a|
        a.input :start, as: :datepicker,
                             datepicker_options: {
                                min_date: Date.today,
                                max_date: Date.today + 1.year
                              }

        a.input :end, as: :datepicker,
                             datepicker_options: {
                                min_date: Date.today + 1.day,
                                max_date: Date.today + 1.year
                              }
    end
  end
    f.actions
  end


   permit_params :name, 
                 :lowest_price, 
                 :image, 
                 :description, 
                 :stock, 
                 :certificate, 
                 :artist_id,
                 auctions_attributes: [:id, :start_date, :end_date, :round, :_destroy],
                 types_attributes: [:id, :name, :_destroy] 
end


