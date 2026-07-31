class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-arm64"
      sha256 "90f48017fbf2b80d0e2ca2a36ccb7e6ba44ad538e28a98ebf26992e0152a451f"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-amd64"
      sha256 "5c5bb4485a3559c4c17f7f7036b189ec05423093b2f1d4ed82dccf02116a6295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-arm64"
      sha256 "4d1bcdee62f7414eced090dc5712fee7f1bd626c6984afdc4ac0cb6bce48b7d3"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-amd64"
      sha256 "faa4e81614a5f1b88ee18d7629f533d34746bd441d5fedef602c8f2995f26772"
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
