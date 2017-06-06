#!/usr/bin/env sh
create_ssh_config() {
  profile="$1"
  server="$2"
  ssh_key="$3"
  lower_server=$(echo "${server}" | tr '[:upper:]' '[:lower:]')
  new_ip=$(aws ec2 describe-instances \
    --filters \
      "Name=instance-state-code,Values=16" \
      "Name=tag:aws:autoscaling:groupName,Values=asg${server}2" \
    --profile "${profile}" \
    --query "Reservations[*].Instances[*].PublicIpAddress" \
    --output text)
  if [ "${new_ip}" = "" ]; then
    return
  fi
  cat << EOF > "$HOME/.ssh/config.d/vp-${profile}-${lower_server}"
Host vp-${profile}-${lower_server}
  HostName ${new_ip}
  User ec2-user
  Port 22
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.ssh/${ssh_key}
  IdentitiesOnly yes
  LogLevel FATAL
EOF
}

create_ssh_config prod JBoss nov159128-frankfurt.pem
create_ssh_config prod Tomcat nov159128-frankfurt.pem
create_ssh_config apptest JBoss nov015388-frankfurt.pem
create_ssh_config apptest Tomcat nov015388-frankfurt.pem