## ServerInit

初始化服务器配置脚本

此脚本仅用于快速下载软件的配置文件

执行方法：

```bash
curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init.sh | bash

# 暂时无法在cloud-init中执行
bash <(curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init.sh)
```

## 其他

`init-pc.sh` 个人电脑使用

```bash
curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init-pc.sh | bash
```

或者用代理：

```bash
curl -fsSL https://ghfast.top/https://raw.githubusercontent.com/ListenV/ServerInit/main/init-pc.sh | bash
```
