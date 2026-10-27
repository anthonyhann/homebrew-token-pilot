cask "token-pilot" do
  version "0.3.3"
  sha256 "57bf328cbc0a9a0ddf7201c072cf7f46cb26ce24d9112b94a15e89a1b511dada"

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
