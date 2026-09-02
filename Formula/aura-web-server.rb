class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-web-server-darwin-arm64"
      sha256 "abc0821b99de6d38e815135aeba4c904230722749b3a9b8ed67eded48d832f78"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-web-server-darwin-amd64"
      sha256 "bca54c9b97aca62e3951d2b043c78938b8b6e88949eadebfcb6f68a054c43a7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-web-server-linux-arm64"
      sha256 "968b9cd2faaab98dd4573ee8b7f3f52b48a67e39ea62d37a0a142cd38988b5f1"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-web-server-linux-amd64"
      sha256 "1800a670fea4c6e0994865f712a3d98282c408663de5489c2f3b2c745ba20d49"
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
