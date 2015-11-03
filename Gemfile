pwd = File.dirname(__FILE__)
work_dir = File.absolute_path(pwd + '/../../public/themes/fedmine')

p "Installing Fedmine Theme"

script = <<-EOS

cd #{pwd}
mkdir -p #{work_dir}
EOS

if 0 == `echo -n $(which git >/dev/null 2>&1; echo $?)`.to_i &&
	0 == `echo -n $(git rev-parse >/dev/null 2>&1; echo $?)`.to_i
	script << <<-EOS
git submodule update --init
git submodule update --remote
GIT_WORK_TREE=#{work_dir} git checkout -f HEAD
EOS
else
	script << <<-EOS
	if [ `which curl` ]; then
		DLAPP=`which curl`" -L -o __OUT__ __URL__"
	elif [ `which wget` ]; then
		DLAPP=`which wget`" --progress=dot -O __OUT__ __URL__"
	else
		exit 1
	fi

	IFS=$'\n'
	for module in $(cat .gitmodules | tr -d '\n' | sed -e "/\[submodule \"[^\"]\+\"\]\s\+/{s//\n/g}" | sed -e "/\(\s*url = \)\?\(.*\?\)\t*path = \([^\t]\+\)\t*\(url = \)\?\(.*\)/{s//\3\t\2\5/g}" | awk '{$1=$1};1')
	do
		IFS=' ' read -ra repo <<< $module
		path=${repo[0]}
		url=${repo[1]}"/archive/master.zip"

		download=${DLAPP/__OUT__/$path.zip}
		download=${download/__URL__/$url}

		mkdir -p $path
		eval $download
		unzip -o $path.zip -d $path
		mv $path/*/* $path
		rm $path.zip
	done
	cp -r . #{work_dir}
EOS
end

script << <<-EOS
if [ ! -f #{work_dir}/images/custom-logo.png ]; then
	cp #{work_dir}/images/logo.png #{work_dir}/images/custom-logo.png
fi

rm -rf #{work_dir}/app
rm -rf #{work_dir}/config
rm -rf #{work_dir}/.git
rm -rf #{work_dir}/Gemfile
rm -rf #{work_dir}/lib
rm -rf #{work_dir}/init.rb
EOS

system(script)
