class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-arm64"
      sha256 "08455209dc6e807f6e5b1ec642128285b61a94c4db7778fec3e017f7f1a7c6e6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-amd64"
      sha256 "6125f2487e1cb22ece4f3321fb11060647b95b85a09c0f6e2fa51088335ac474"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-arm64"
      sha256 "b317e157b27f458be5d8be7a8cc09ad75157f8321201cac7f13ce551d88bab36"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-amd64"
      sha256 "286d183c290e4c0f8e466d31bf540c12df090d12bdd5608a7b5d3def35e7b196"
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
