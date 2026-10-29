# homebrew-token-pilot

[token-pilot](https://github.com/anthonyhann/token-pilot) 的 Homebrew tap。

```bash
brew install --cask anthonyhann/token-pilot/token-pilot
```

> 这个 cask 只支持 Apple Silicon（arm64）。Intel Mac 请直接下载 dmg。

## ⚠️ 注意：这个 app 自带自动更新，和 brew 装会冲突

token-pilot 是状态栏应用，内置了自动更新（右键托盘图标 →「检查更新」）。
**自动更新会直接替换 `/Applications/token-pilot.app`，而 brew 仍按自己的记录管理同一个 app。**
两边互踩会出现这些症状：

- 右键「检查更新」报失败
- `brew upgrade --cask token-pilot` 反而把自己装回旧版本
- 版本号显示的和实际情况对不上（跑 `token-pilot doctor` 会直接告警）

### 推荐：直接下载 dmg，不要用 brew

到 [Releases 页](https://github.com/anthonyhann/token-pilot/releases/latest) 下载 `token-pilot_<版本>_aarch64.dmg`（Apple Silicon）
或 `x64.dmg`（Intel），拖进「应用程序」。之后新版本会自动检查，也能随时右键手动更新。

首次打开如遇到 Gatekeeper 拦截，执行：

```bash
xattr -dr com.apple.quarantine /Applications/token-pilot.app
```

### 如果你已经用 brew 装了

从 brew 退出（会保留 `/Applications` 里的 app），之后改用 app 自己的更新：

```bash
brew uninstall --cask token-pilot --force
```

如果卸载报 `Operation not permitted`，说明沙箱或权限挡住了 Caskroom 的软链删除，手工清掉即可：

```bash
rm -rf /opt/homebrew/Caskroom/token-pilot
```

### 如果你就想用 brew 管

那就别点 app 里的「安装更新」，每次手动升级：

```bash
brew upgrade --cask token-pilot
```

`token-pilot doctor` 会检测这种冲突并给出提示。

## 关于签名

app 目前没有 Apple 开发者签名，所以 brew 安装后会自动执行
`xattr -dr com.apple.quarantine` 去掉隔离属性。自动更新包本身有独立的
minisign 签名校验，下载内容被篡改会拒绝安装。
