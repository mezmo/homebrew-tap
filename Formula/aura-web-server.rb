class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-web-server-darwin-arm64"
      sha256 "a88ba17cc5fcbd06364e2c41c8f2b904ce064b2b3673d519cdfcb9e08ee249fa"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-web-server-darwin-amd64"
      sha256 "b765bbd39713e4a767ba50753f45b31e1575c1b857d7ed1c372de7b5af11026f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-web-server-linux-arm64"
      sha256 "aa3de760d06e146fd756e73ad78c2268b8a42675e36ec85ae13addfaffababca"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.5/aura-web-server-linux-amd64"
      sha256 "9ecd29e1bd01ce45c2a44f424b40ba3b6cd7d65d7e291afc9eb84e7d3c8309d1"
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
