class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-arm64"
      sha256 "940506044467287dde8cf9266fd5c292531a24d8c912fd56b33b0589c82434fb"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-amd64"
      sha256 "f01ed9ce5be5e264bbe814c4e4cf832e58b32368fb941296ca64f00458d3b835"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-arm64"
      sha256 "246798863ade8288d30a325d850aee3efbb56bbc91876decc3547b6a0f39ce17"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-amd64"
      sha256 "f9504934a0b1eaa6883a89429d584c3391ad3c5c10b5baa0873d97fa3e0184f7"
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
