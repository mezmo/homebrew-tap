class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-arm64"
      sha256 "cc24d7c73c0ed3147d8d4ed2f591f8dbbbe21ec1190c91404c939761e04c617a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-amd64"
      sha256 "bb6a5b71015355be6038270d9eb40e1bb70b8fc1e60d77650854da6d4a156a86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-arm64"
      sha256 "71ef84453706590dfff42f25ae6edb7074a0ff4b8de606677c35e17d84fa633a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-amd64"
      sha256 "fdc228489db35cdc154041432f29aee6d02cc325dcfaa72d7b73d23411237b98"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    source = "aura-#{os}-#{arch}"

    chmod 0755, source
    bin.install source => "aura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aura --version")
  end
end
