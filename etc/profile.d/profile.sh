source /opt/rh/devtoolset-7/enable

export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))
export PATH=/usr/local/src/apache-maven/bin:${PATH}