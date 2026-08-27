class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-darwin-arm64"
      sha256 "377242f5eeb94d7f41d55e82b05f1061b7085bcd012c7d750f1e18b58b493914"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-darwin-amd64"
      sha256 "8d4976b3e73926ff237e5a106cffe99c4bd493f0801c4d10a1b103e6b5530210"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-linux-arm64"
      sha256 "a8875f82f88098ba889b046c353f930085676d16981b41622396fb860a84b5b3"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-linux-amd64"
      sha256 "1850d77f721bc6729dc847899815f0ed7d69491134bfa76abbeeb2605172b2fd"
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
