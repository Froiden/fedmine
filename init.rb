require 'redmine'

Rails.application.config.to_prepare do
end

Redmine::Plugin.register :fedmine do
	name 'Fedmine Theme'
	author 'Pouyan Heyratpour'
	description 'Fedmine flat theme with rtl support'
	version '1.0.0'
	requires_redmine :version_or_higher => '3.0.0'
	url 'https://github.com/ghasedak/fedmine'
	author_url 'https://github.com/pouyanh'

	settings(:partial => 'settings/fedmine')
end
