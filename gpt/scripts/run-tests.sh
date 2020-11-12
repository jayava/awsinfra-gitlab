#!/bin/bash

docker run -it --env-file access-token.env -v /home/ec2-user/gpt/config:/config -v /home/ec2-user/gpt/results:/results registry.gitlab.com/gitlab-org/quality/performance/gitlab-performance-tool --environment /config/environments/poc.json --options /config/options/20s_2rps.json
