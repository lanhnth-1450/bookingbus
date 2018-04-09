class Admin::BusController < ApplicationController
	layout "application_admin"
	def index
		@buses = Bus.all
	end
end
