class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-darwin-arm64"
      sha256 "be935b8a5cdaae11919ae72afee22ae67ea742b3457c9dc4bdd26788accbf9cb"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-darwin-amd64"
      sha256 "1aafa220778d6a0107fed321b316b19196986918e2aaf8c100a69792658f8a2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-linux-arm64"
      sha256 "6c45af514240a294d5ba45a573007639f33089dfe77b6356d44715fc70a71d8f"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-linux-amd64"
      sha256 "a7440f74d5f91b9ca3e6aca34c19284e56e950cf2ba3df460bf1bc780e0c80a8"
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
