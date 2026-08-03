class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-arm64"
      sha256 "9e5b924a88538df0dccd2e06e851efd46d6e7ab48786fe4a7c97e3afcc1a1d76"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-amd64"
      sha256 "edeec450ef23f472e961aa381568ea5957950e6673a0d07e0eb36d855e83ba1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-arm64"
      sha256 "dcd12c30ebbc97e7594d11f1f7dbfa11767521a943d0a6c42e476a05a2832791"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-amd64"
      sha256 "929473163724dcc77ab9e26d3fd8721a497a09638f91421f7a46b00a580e7908"
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
