class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-web-server-darwin-arm64"
      sha256 "e256f908291fb7b054f86850229204b044204b91d843051e33b97957b6b78e39"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-web-server-darwin-amd64"
      sha256 "958aec71358c9f5249aff77a79a82ce53fb89ccbe93590cb58ecc64dbec87bd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-web-server-linux-arm64"
      sha256 "15a0ddd8859ddab58c71ca65b20b871e90e793c73a8eb0f1a8fd38c293c8b423"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-web-server-linux-amd64"
      sha256 "b2dd9165432e96839cce982aa8e372496654366309e395060db8b9214f985c40"
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
