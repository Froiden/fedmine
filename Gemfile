pwd = File.dirname(__FILE__)
work_dir = File.absolute_path(pwd + '/../../public/themes/fedmine')

script = <<-EOS
cd #{pwd}
mkdir -p #{work_dir}

>&2 echo #{work_dir}

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