class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-web-server-darwin-arm64"
      sha256 "f32de87774b92e8c0b313d7d53c3bb172f6b4078cbecb8d04bb314803ce20b3e"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-web-server-darwin-amd64"
      sha256 "3547f463d45a3c336cb97ed2b59fcc8db682c50b8db327b8ff64c540324d9014"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-web-server-linux-arm64"
      sha256 "938e885782accc0069164b7123347ff032fd9217db4d568459408278d20e4548"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.8/aura-web-server-linux-amd64"
      sha256 "f829b1a99ab4c7edfce8670bc80f564584e348fdf01752bf3be1209099b17042"
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
