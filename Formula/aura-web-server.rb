class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-web-server-darwin-arm64"
      sha256 "2f4ed6ccc78517cc337018616d14bf8db747ceff8abf2fd6fd0292d4268452ab"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-web-server-darwin-amd64"
      sha256 "1c915dd7b4688f6f10c6e67a36a5a22c29419e8105157599c01e116d015e0035"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-web-server-linux-arm64"
      sha256 "0c0e68864997129162401688d60003a22d937f9330a1a8ca3a43a0a79ac7ffbc"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-web-server-linux-amd64"
      sha256 "f31a2f48252a5a2805a2d1b169f3d7c01241ccab0418e1a7c1d603b583814998"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    source = "aura-web-server-#{os}-#{arch}"

    chmod 0755, source
    bin.install source => "aura-web-server"
  end

  def caveats
    <<~EOS
      aura-web-server needs an AURA config. Point it at one with CONFIG_PATH:
        CONFIG_PATH=/path/to/config.toml aura-web-server
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aura-web-server --version")
  end
end
