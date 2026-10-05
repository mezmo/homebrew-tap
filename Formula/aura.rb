class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-darwin-arm64"
      sha256 "d100ba3d8029bbdb9ba3e24f7c6e26c60993f72cd1a49c42d6803a3ee3a552ba"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-darwin-amd64"
      sha256 "d8b47036c7aaae7f97bff04891ee98acd7f3fa13a7c66de5940656fde02b8504"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-linux-arm64"
      sha256 "5aab7f0b5ac90b3f7d942979c9a0553204649b2d33bf4b44b9c5e6135c10529d"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-linux-amd64"
      sha256 "852a3bedb9bcdf9de7f975233b1f2113c85973e6b8c584a7fa68cc74ce415168"
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
