class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-darwin-arm64"
      sha256 "d88bc9e33848e624f156de068da11fb45fe7e4af070d0171b723325c5a9e509d"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-darwin-amd64"
      sha256 "ed1a828e3b077bd5ec8dc6842e4fda19167e59b386889f0d73b616f7d9477766"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-linux-arm64"
      sha256 "84b4fa2e7c0fc8139196b27a8f9310436f664fa66cf0e4206a537748628898a2"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-linux-amd64"
      sha256 "ce97126d640117d6b02f6b161fcd72179639caa1537851a3884558ff27a62cda"
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
