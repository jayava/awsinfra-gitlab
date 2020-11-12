#!/bin/bash

docker run --env-file access-token.env -v /home/ec2-user/gpt/config:/config -v /home/ec2-user/gpt/results/:/results -it registry.gitlab.com/gitlab-org/quality/performance/gpt-data-generator --environment /config/gpt-test.json --no-vertical --unattended