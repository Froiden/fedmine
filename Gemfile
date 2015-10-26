pwd = File.dirname(__FILE__)
work_dir = '/home/redmine/redmine/public/themes/fedmine'

script = <<-EOS
mkdir -p #{work_dir}
cd #{pwd}

git status
if [ $? -eq 0 ];
then
	git submodule update --init
	git submodule update --remote

	GIT_WORK_TREE=#{work_dir} git checkout -f HEAD
else
	cp -r . #{work_dir}
fi

EOS

`#{script}`