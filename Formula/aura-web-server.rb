class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-web-server-darwin-arm64"
      sha256 "1ca49b5edf09f975ffda77bee29f40e6e85d4606a6091a2c48f809cd49617f20"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-web-server-darwin-amd64"
      sha256 "924dca3ffbb4dfd277cd0aa5d53b9a9d7a4bbbc60e360c07419acb2917d3fa4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-web-server-linux-arm64"
      sha256 "370842c191fd836a0002555b2fd7adad218c5e01d8316e398e6700ccb112bf67"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.16/aura-web-server-linux-amd64"
      sha256 "ab304077fba3e819ad246c778d9b5d5cfc9354bf070b4216ad450d0a44f49a77"
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
