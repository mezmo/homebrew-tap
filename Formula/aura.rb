class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-darwin-arm64"
      sha256 "5b7854719aa8213c4a8577a33116cc83f17d35c001e7879f2ee8e9c1b783b789"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-darwin-amd64"
      sha256 "6ff2b947e83082657985d74ef480eb03d619a59a27da24a274d16326a1f0fc74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-linux-arm64"
      sha256 "4116e3d7cf6ff71909b7f019cd6b0b98166f6b21d18c6fffcbcd876bb6ca83b9"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-linux-amd64"
      sha256 "220d6c94deda4f5b9780964b478d08e7f389f8186630d53b104a9a714d2bad0d"
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
