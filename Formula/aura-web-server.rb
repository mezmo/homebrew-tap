class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-arm64"
      sha256 "dd6b30993be3cd436b7f53a3e9125f843fa6f989cd1afb7e14a260d75dd30c8e"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-amd64"
      sha256 "c0404100668c83c4a62004e57d982c0e4732185694e6e0bb2e19a3393702e2a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-arm64"
      sha256 "5ccd2be760faab5a4eb604b0ba95f54f604e3d7e7b990443de8a00c8a1daf5e6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-amd64"
      sha256 "14b4edf56bfa86fae39dae8a3f670a3628ec24827c5687a63340b312e12861ad"
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
