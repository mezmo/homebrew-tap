class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-web-server-darwin-arm64"
      sha256 "096d84236355dd9f9ea7443c61954acc3c9342f8efdadf562edb10700b698a51"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-web-server-darwin-amd64"
      sha256 "0ac6d7ac65535b768fd73f98c333dbfcd9c90820e483e4c416ece30296942945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-web-server-linux-arm64"
      sha256 "94fc57af83b6c320d65da69a03925e48980e53474e2c05eec8e12383f61ef9a6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.6/aura-web-server-linux-amd64"
      sha256 "d8a326867dfe64cbe0c356b2d16bf2a4978cbf9abcf752622702aa4bfa1a34b7"
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
