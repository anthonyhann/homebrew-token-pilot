cask "token-pilot" do
  version "0.2.8"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
