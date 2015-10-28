module Fedmine
	module SettingsControllerPatch
		def self.included(base)
			base.send(:before_filter, :upload_logo, :only => :plugin)
		end

		def upload_logo
			@plugin = Redmine::Plugin.find(params[:id])

			if request.post? && params[:id] == 'fedmine' && params[:settings][:logo].is_a?(ActionDispatch::Http::UploadedFile)
				uploaded_io = params[:settings][:logo]

				File.open(Rails.root.join('public', 'themes', 'fedmine', 'images', 'custom-logo.png'), 'wb') do |file|
					file.write(uploaded_io.read)
				end

				redirect_to plugin_settings_path(@plugin)
			end
		end
	end
end