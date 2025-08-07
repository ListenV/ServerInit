## InitLinux

此脚本用于快速初始化Linux基础且通用的配置

## 如何使用

- `init-server.sh`：用于初始化服务器
- `init-pc.sh`：用于初始化个人pc

执行方法：

```bash
curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init-server.sh | bash

curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init-pc.sh | bash
```

或者用代理：

```bash
curl -fsSL https://ghfast.top/https://raw.githubusercontent.com/ListenV/ServerInit/main/init-server.sh | bash

curl -fsSL https://ghfast.top/https://raw.githubusercontent.com/ListenV/ServerInit/main/init-pc.sh | bash
```

## 其他

下面这种暂时无法在cloud-init中执行

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ListenV/ServerInit/main/init-server.sh)
```
