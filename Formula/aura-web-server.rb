class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-web-server-darwin-arm64"
      sha256 "5fbe6cec02107bd2ec9fe799535c1cb743225dd239da7ad67d2cebfc78aa831a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-web-server-darwin-amd64"
      sha256 "daeef1bfbfa2bd46d13b8bd60b586818233dda059c31ae0b42e8f7ea628a9a32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-web-server-linux-arm64"
      sha256 "043bf971462d69eb083420ce45fbff309f80efbefbc9c09e0145ffa7d4ee8997"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.10/aura-web-server-linux-amd64"
      sha256 "130461cbdf2b2370b02ca9d2d2511f330427f1c17f6890ee2bd4c75f5bbf756f"
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
