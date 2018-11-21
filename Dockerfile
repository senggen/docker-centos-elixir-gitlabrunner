FROM senggen/centos-elixir

RUN yum -y install curl && \
    yum clean all && \
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash && \
    yum -y install gitlab-runner
    wget -qO /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/bin/dumb-init

VOLUME ["/etc/gitlab-runner", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-ci-multi-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
