class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-web-server-darwin-arm64"
      sha256 "e2eda5bc961a346bc5a592345100fa81c0a67bb7abb99761c6f5b4574a6ce71a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-web-server-darwin-amd64"
      sha256 "bdc8e0a2beb8064c9e12261374b06c34a90e98b57a0b9f9f9bcef2ae5319a784"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-web-server-linux-arm64"
      sha256 "02801c980305a07be9367e0dff0cceebcff89cd910c34035c8bac6c354291dd2"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.11/aura-web-server-linux-amd64"
      sha256 "a86ca692c847d8dabc91193fbf23e1283483b107264fc9a99a60ce48916b04bd"
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
