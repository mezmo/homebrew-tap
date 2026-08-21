class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-darwin-arm64"
      sha256 "9b3c567c678878348522a5e6760479579dc0556fdc06f5baa85f55d363518717"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-darwin-amd64"
      sha256 "6237e934132b9564942fa68c3df0f389ecf7ef7e597e98b7b2f50875da7e9b00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-linux-arm64"
      sha256 "55ae81ae886575abbfb6c068ae10a88400268c4ab4a7beb9ab0143d3e9122873"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-linux-amd64"
      sha256 "28d3a0fb73ceed6399626eefb0736f9ef02c65daa5e4f73a26a888b4fd59c087"
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
