#!/bin/bash

# .envファイルを読み込む
source .env

# ホスト名のカウントを初期化
COUNT=1

for IP in "${IP_LIST[@]}"; do
  # ホスト名を設定
  HOSTNAME="${HOST_PREFIX}${COUNT}"
  
  echo "Setting up Tailscale on ${HOSTNAME} (${IP})..."

  # SSHで接続し、Tailscaleをインストールしてホスト名で参加
  ssh -i "$SSH_KEY_PATH" "${SSH_USER}"@$IP << EOF
    curl -fsSL https://tailscale.com/install.sh | sh
    sudo tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=${HOSTNAME}
    sudo systemctl enable --now tailscaled
EOF

  # カウントをインクリメント
  COUNT=$((COUNT+1))
done

echo "Tailscale setup completed for all servers."
