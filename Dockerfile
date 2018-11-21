FROM centos:7

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && locale

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y upgrade && \
    yum -y install \
        gcc \
        gcc-c++ \
        glibc-devel \
        make \
        ncurses-devel \
        openssl-devel \
        autoconf \
        wxBase.x86_64 \
        wget \
        git && \
    yum clean all && \
    rm -rf /var/cache/yum


# Install Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && \
    rpm -Uvh erlang-solutions-1.0-1.noarch.rpm && \
    yum -y install esl-erlang

# Install Elixir
RUN mkdir /opt/elixir && \
    git clone https://github.com/elixir-lang/elixir.git /opt/elixir && \
    cd /opt/elixir && \
    make clean test && \
    ln -s /opt/elixir/bin/iex /usr/local/bin/iex && \
    ln -s /opt/elixir/bin/mix /usr/local/bin/mix && \
    ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc

CMD ["/bin/sh"]
