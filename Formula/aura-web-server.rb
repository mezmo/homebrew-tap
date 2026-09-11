class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-web-server-darwin-arm64"
      sha256 "280f4e772f9a19dd68430e4693efecfcca573b8559eb7a2ddcaecf755a451af5"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-web-server-darwin-amd64"
      sha256 "78daa9f41ada9306f6fdb820683baa4b25a486815bc751144f1fbd5d8cc27df7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-web-server-linux-arm64"
      sha256 "193e82b0d2c66db3ed6dcc842d1408447058a7a3b7975b1958796dc074bd0eac"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-web-server-linux-amd64"
      sha256 "9b7c4b73fac246388327d175c200e0c8f8aa65d0dad74e72c67e5dcfa991437f"
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
