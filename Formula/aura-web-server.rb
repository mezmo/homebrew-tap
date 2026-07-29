class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-arm64"
      sha256 "1b78d5df48107839fef25e996dfa58cf19fe0b33ef405385612c69cdf9c88f0f"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-darwin-amd64"
      sha256 "8371e9e2ce59c89a439c4389283870e014867f04d212690e2ece1c9139f6c76b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-arm64"
      sha256 "eded700001c8c01c87f9b721a7b63526187579436bfda9f393e316a93a6820f6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-web-server-linux-amd64"
      sha256 "d0866519a1c2fc8bde918d086b6cbef3ad3466100e363e92e2040c60122231fd"
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
