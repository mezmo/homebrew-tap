class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-web-server-darwin-arm64"
      sha256 "4caac57eed3d6dc67017a5ccb7d3136946cf96395499ee85761848e834ff4aaf"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-web-server-darwin-amd64"
      sha256 "8cf495c847ab8d6040ca94c599a4f25bedfb97d1d9f2c2d37332b931d4a63b6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-web-server-linux-arm64"
      sha256 "5001eca69965adbc9f67bd196b02b970765fef9360cdbdd1a4919f22d13dea11"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.13/aura-web-server-linux-amd64"
      sha256 "b3eb77543e849dd40b29987d25e0105414b478fc682b430a4def84a56bb1a665"
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
