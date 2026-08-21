class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-web-server-darwin-arm64"
      sha256 "46e79f83d37aac2e3a2336de8a9167e4d3ce19202b7ea34fc4c5852fd98b982e"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-web-server-darwin-amd64"
      sha256 "d811dde4110b217e3e8b6f6208501a2b8dc56999f0759e45959911d18adc9ce2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-web-server-linux-arm64"
      sha256 "b6632445e17c5d9596dfe39584a0fd01492a91bed9d79ea977d299103fef52b6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.3/aura-web-server-linux-amd64"
      sha256 "2ab275ab014d07853b8a5700b595cd5378122d9d058f7c8b60ee5fe8967acc41"
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
