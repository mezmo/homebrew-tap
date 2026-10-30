class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-web-server-darwin-arm64"
      sha256 "bede1444d00288d7a777b66b030d023099904757599da33914b9e609fcf3211c"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-web-server-darwin-amd64"
      sha256 "64445b7616d570a82c737de73386709e8e26c79baa1188301332fee9d910e35d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-web-server-linux-arm64"
      sha256 "edcfcdced1e0f252327b2f66b7ab9a2e0c24526551a50da650d91f9d6d2a9c83"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-web-server-linux-amd64"
      sha256 "68fcec5ccf439500e3664ab6145388ed1f0112c4b24837828b08706ea4123ee1"
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
