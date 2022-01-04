[master]
masternode ansible_host=${host1}

[node]
workernode1 ansible_host=${host2}
workernode2 ansible_host=${host3}

[all:vars]
ansible_user = ${user}
ansible_ssh_extra_args='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
ansible_python_interpreter=/usr/bin/python3
