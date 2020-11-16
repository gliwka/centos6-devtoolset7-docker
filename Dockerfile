FROM centos:centos6
RUN yum -y install centos-release-scl yum-utils &&\
    yum-config-manager --enable rhel-server-rhscl-7-rpms &&\
    yum -y install devtoolset-7-gcc-c++ devtoolset-7-gcc cmake &&\
    yum clean all

ENV BASH_ENV=/etc/profile.d/enable.sh

ADD ./etc /etc
ADD ./root /root

ENTRYPOINT [ "/bin/bash" ]
