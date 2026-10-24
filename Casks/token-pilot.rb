cask "token-pilot" do
  version "0.2.6"
  sha256 "0bf9415d9f99c182dfd731936f31c044c24196896a2b51da6cf3ac8200597cf2"

  url "https://github.com/anthonyhann/token-pilot/releases/download/v#{version}/token-pilot_#{version}_aarch64.dmg"
  name "token-pilot"
  desc "你所有 AI 工具的本地账单 + 预算控制器（状态栏应用）"
  homepage "https://github.com/anthonyhann/token-pilot"

  depends_on arch: :arm64

  app "token-pilot.app"

  # Homebrew 安装时自动移除 quarantine（未签名应用的 Gatekeeper 误伤）
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/token-pilot.app"]
  end

  zap trash: "~/.token-pilot"
end
