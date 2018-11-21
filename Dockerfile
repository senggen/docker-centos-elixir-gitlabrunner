FROM senggen/centos-elixir

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash && \
    yum -y install gitlab-runner && \
    yum clean all && \
    wget -qO /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/bin/dumb-init && \
    ssh-keygen -f id_rsa -t rsa -N '' && \
    cat ~/.ssh/id_rsa.pub

VOLUME ["/etc/gitlab-runner", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-ci-multi-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
