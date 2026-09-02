class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-darwin-arm64"
      sha256 "81db208d774212335029c2b3e1ee536ad31eecaee55a418e9ed62d7a2b20dff2"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-darwin-amd64"
      sha256 "2a6fc7235b22ca6e97b7a412b8d11660a61e21cc4ac2338c8beb53717e01661f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-linux-arm64"
      sha256 "7bef9b0cf85bf73167d60b625c70edf5e8740b4584f1b19c8aa265b95a6dbe28"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-linux-amd64"
      sha256 "2094c238885dbccb75bb5fa7c46297f20c833a1e3328d6ca16e2a214c3d170dd"
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
