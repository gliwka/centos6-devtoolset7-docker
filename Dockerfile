FROM centos:centos6
RUN sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever\//baseurl=http:\/\/vault.centos.org\/6.10\//g' /etc/yum.repos.d/*.repo &&\
    yum -y install centos-release-scl yum-utils &&\
    sed -i -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#\s\{0,1\}baseurl=http:\/\/mirror.centos.org\/centos\/6\//baseurl=http:\/\/vault.centos.org\/6.10\//g' /etc/yum.repos.d/CentOS-SCLo-*.repo &&\
    yum-config-manager --enable rhel-server-rhscl-7-rpms &&\
    rpm -ivh https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm &&\
    yum -y install devtoolset-7-gcc-c++ devtoolset-7-gcc cmake patch git zulu8-jdk &&\    
    yum clean all

RUN cd /usr/local/src/ &&\
    curl -L -o apache-maven-3.6.3-bin.tar.gz https://apache.mirror.digionline.de/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz &&\
    echo "26ad91d751b3a9a53087aefa743f4e16a17741d3915b219cf74112bf87a438c5  apache-maven-3.6.3-bin.tar.gz" | sha256sum -c &&\
    tar -xvf apache-maven-3.6.3-bin.tar.gz &&\
    rm apache-maven-3.6.3-bin.tar.gz &&\
    mv apache-maven-3.6.3/ apache-maven/


ENV BASH_ENV=/etc/profile.d/profile.sh

ADD ./etc /etc
ADD ./root /root

ENTRYPOINT [ "/bin/bash" ]
