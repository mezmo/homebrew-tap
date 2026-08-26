class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-darwin-arm64"
      sha256 "f7d5e1b8c3aa5053c1facc9bbcd49bc6e347fee572aeaf17e42fb2e2b56327fa"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-darwin-amd64"
      sha256 "67f4cf04f4208dd8a379d64aa0de9847d1398f9988863bded359dffe353c78bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-linux-arm64"
      sha256 "2fecbec1f2f1121f2c8d168a69e8144c170ad4e4175ccf737ec261c13dd646bb"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-linux-amd64"
      sha256 "60e5e7c0e96cb5e7f85bd765d2929bfcb9d20e4a9919a78e940e4c91dea36f40"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    source = "aura-#{os}-#{arch}"

    chmod 0755, source
    bin.install source => "aura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aura --version")
  end
end
