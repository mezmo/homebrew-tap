class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-darwin-arm64"
      sha256 "d16eddc6a6c542edba7192e44e1d5e0c10970ad2b59f2dcfa1ad7a099c4f15f7"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-darwin-amd64"
      sha256 "bf70f20b0243c023c5e15d2d256eb4ef05bda27e0427eec8ae573f2c000fdd89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-linux-arm64"
      sha256 "346a2f0e7636338cb670a597fd0807f5fb208f8ea9a300376a8d81fd2f0bbc70"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-linux-amd64"
      sha256 "7cdf7ed76f80e0f16834557a54b742951cb32f41a52c6ce69243e9aa6ba48134"
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
