# isucon-o11y
各種可視化ツールの詰め合わせ環境

## 起動できるサービス

- pprotein: 各種ログの統計情報の管理・閲覧
- prometheus: メトリクスの収集・閲覧 node-exporter, process-exporterを導入
- jaeger: トレースの収集・閲覧



## 利用方法

### 可視化用の各種サーバーの起動

docker-compose up -d


### 監視対象への各種ツール、ログ出力設定の変更

```
cd ansible
ansible-playbook -i inventory.yaml setup_targets.yaml
```

## 修正が必要な個所について

### 必須: pprotein/data/alp.yml

ウェブアプリのエンドポイントによってパターンが変わる。
パターンの生成はchatGPTに任せよう。

### 必須: ansible/inventory.yaml

監視対象のIPアドレス等の設定が必要。

### 任意: ansible/roles/mysql/files/etc/mysql/mysql.conf.d/mysqld.cnf

slowlog以外のところはチューニングにも関与する。  
事故を防ぐ意味では、本番中に設定ファイルを引っ張ってくる方が安全かも。

### 任意: ansible/roles/nginx/files/etc/nginx/nginx.conf

同上。  
ログ出力形式以外。
