name "cloudkeeper-one"
## WARN: do not forget to change CLOUDKEEPER_ONE_VERSION in the postinst script
default_version "1.3.0"

dependency "ruby"
dependency "rubygems"
dependency "liblzma"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
}

build do
  gem "install xmlrpc -n #{install_dir}/bin --no-rdoc --no-ri", :env => env
  gem "install cloudkeeper-one -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}", :env => env

  mkdir "#{install_dir}/examples/"
  copy File.join(project.files_path, '*'), "#{install_dir}/examples/"

  delete "#{install_dir}/embedded/docs"
  delete "#{install_dir}/embedded/share/man"
  delete "#{install_dir}/embedded/share/doc"
  delete "#{install_dir}/embedded/ssl/man"
  delete "#{install_dir}/embedded/info"
end
