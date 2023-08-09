# Ansible で AWS に WordPress サーバを構築するプレイブックサンプル
- AWS 環境は Terraform に一任し、 Ansible で Terraform のロールを実行する
- WP-CLI で Wordpress の初期設定と Wordpress テーマ [Cocoon](https://wp-cocoon.com/) を設定する

# 環境
- WSL2 の Ubuntu 22.04.2 LTS (Jammy Jellyfish) で Ansible を実行

# 前提
- Ubuntu 環境に Ansible 2.15.2、 Terraform 1.5.4、 AWS CLI 2.13.6　インストール済み
- AWS アカウント、 IAM ユーザは作成済み
- aws configure を実行し AWS CLI に資格情報を設定済み
- EC2 に公開鍵を登録するため、ローカルで鍵ペアを作成済み

# 使い方
1. Terraform ロールのみ実行して AWS 環境を整える
```
ansible-playbook -i hosts.yml site.yml --tags=aws
```
2. デバッグで出力された EC2 インスタンスの IP アドレスを記入する (aws_wordpress/group_vars/all.yml)
```diff
-wp_public_ip: <dummy>
+wp_public_ip: XXX.XXX.XXX.XXX
```
3. 再度プレイブック実行する
```
ansible-playbook -i hosts.yml site.yml
```
4. http://XXX.XXX.XXX.XXX/wordpress にアクセスすると WordPress のホームが表示される