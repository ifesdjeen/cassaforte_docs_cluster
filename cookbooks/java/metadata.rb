maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Java runtime."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.1"

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

%w{ apt timezone }.each do |cb|
  depends cb
end

recipe "java", "Installs Java runtime"
recipe "java::openjdk", "Installs the OpenJDK flavor of Java"
recipe "java::sun", "Installs the Sun flavor of Java"