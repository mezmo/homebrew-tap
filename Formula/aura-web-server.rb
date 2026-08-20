class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.2/aura-web-server-darwin-arm64"
      sha256 "f41c72173dd5387f47569e838ba61af3ddd490fb1cfbb8a5b3cda4d63c9ea83f"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.2/aura-web-server-darwin-amd64"
      sha256 "0e36b89a102fbbaac8834f25a3036d568e4824e5bff479635f05f8fe580ba4bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.2/aura-web-server-linux-arm64"
      sha256 "a2d38614bf6cd962df0b691426b2cd5e7b82ab3d08d9af55b5b9b5b0ff24f513"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.2/aura-web-server-linux-amd64"
      sha256 "655e5713eee40452624d932d7fec2d2c372fccefd4a40dbd0f0594508e9ce88b"
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
