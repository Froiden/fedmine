pwd = File.dirname(__FILE__)
work_dir = File.absolute_path(pwd + '/../../public/themes/fedmine')

p "Installing Fedmine Theme"

script = <<-EOS
cd #{pwd}
mkdir -p #{work_dir}
EOS

is_git=0 == `echo -n $(git rev-parse >/dev/null 2>&1; echo $?)`.to_i

if is_git
	script << <<-EOS
git submodule update --init
git submodule update --remote
GIT_WORK_TREE=#{work_dir} git checkout -f HEAD
EOS
else
	script << "cp -r . #{work_dir}\n"
end

script << "cp #{work_dir}/images/logo.png #{work_dir}/images/custom-logo.png\n"

system(script)
