class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-darwin-arm64"
      sha256 "7839446e5d75b5e1413ec54737dc909010914323b1372def983cabd04511cbf8"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-darwin-amd64"
      sha256 "adf9721b2962856fb48938bd928a29c88af3f82462454717761f83f598cac714"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-linux-arm64"
      sha256 "8b17819927f17d4d49db27b4ad4af4e2efb6d24dd1f29de085ce7230a5b1af4a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-linux-amd64"
      sha256 "8c38ecd23c8b73cb5d0919663ec0ed6900d4b1e03be9ab5ae65a87ab20421a38"
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
