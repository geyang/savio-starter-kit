# parameters
USERNAME=geyang
LOGIN_NODE=hpc.brc.berkeley.edu
LOCAL_PORT=42000
SSH_PORT=22

# targets
ssh:
	ssh ${USERNAME}@${LOGIN_NODE}
tunnel:
	echo "\033[32mBuilding Tunnel in the foreground...\033[0m\n"
	ssh -N -L ${LOCAL_PORT}:localhost:${SSH_PORT} ${LOGIN_NODE}
	# ssh -N -p 22 localhost -L 0.0.0.0:${LOCAL_PORT}:${LOGIN_NODE}:${SSH_PORT}
tunnel-background:
	echo "\033[32mBuilding Tunnel in the background...\033[0m\n"
	ssh -N -f -J ${LOCAL_PORT}:localhost:${SSH_PORT} ${LOGIN_NODE}
	echo "\033[32mTunnel Built!!\033[0m\n"
kill-all-tunnel:
	ps aux | grep -ie 'ssh -N -f -J' | awk '{print $2}' | xargs kill -9
ssh-test:
	ssh localhost -p ${LOCAL_PORT}

