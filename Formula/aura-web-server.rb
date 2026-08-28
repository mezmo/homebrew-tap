class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-web-server-darwin-arm64"
      sha256 "4797b7f2c21252927a3537293bf829738d65838d4b27dcf66087a88a0b0ad2c4"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-web-server-darwin-amd64"
      sha256 "2417e472ee1debee47b09ad62f0d0ae68286213ae516ff0365942f45b4a2f299"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-web-server-linux-arm64"
      sha256 "e86fe4142058d950ad8ba7748ab56d1f4084b73fa2db04246fbd1c3bc49cca3a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.12/aura-web-server-linux-amd64"
      sha256 "b1038f68584888bdd20cae05214b374c5c5b67c7b8938039fa8e76c127f4cb99"
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
