#!/bin/bash
systemctl start docker &
/usr/bin/dumb-init gitlab-runner run --user=root --working-directory=/home/gitlab-runner
