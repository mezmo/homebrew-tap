class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-web-server-darwin-arm64"
      sha256 "c110199e77a194ce3e9e02b7df93ca4fa40a115926e1bc773e42d7f84022009f"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-web-server-darwin-amd64"
      sha256 "b943ed08af33ab24b9a5fe3673cad6d49d20b98f4759c5d7417b760814017d78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-web-server-linux-arm64"
      sha256 "6dfbee42f4004e7da6fd94c67a1e68b6c0271fedb43f88c351c8dd993b3e8feb"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-web-server-linux-amd64"
      sha256 "e51aca7ea945c65cbcc71b12a2ca894a18a525c2358177d8204037dc6be0e652"
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
