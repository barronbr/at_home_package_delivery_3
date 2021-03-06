class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user.present?
      @packages = current_user.packages.all
      @schedules = current_user.schedules.all
    else
      render 'welcome'
    end
  end

  def about
  end

  def active_shipping

    Package.all.each do |package|
      fedex = ActiveShipping::FedEx.new(login: ENV["fedex_login"], password: ENV["fedex_password"], key: ENV["fedex_key"], account: ENV["fedex_account"], :test => true)

      @tracking_info = fedex.find_tracking_info(package.tracking_number, :carrier_code => 'fedex_ground') # Ground package 231300687629630

      @tracking_info.shipment_events.each do |event|
        "#{event.name} at #{event.location.city}, #{event.location.state} on #{event.time}. #{event.message}"
        if event.name == "On FedEx vehicle for delivery"
          UserMailer.notification_email(package.user).deliver
        else
        puts "this didn't work"
        end
      end
    end
  end



end
