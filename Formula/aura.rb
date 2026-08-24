class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-darwin-arm64"
      sha256 "910d0cc0e4c4fc3b9141606c429a159d6ce40d6400ddea4f9a06ae522a3305d9"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-darwin-amd64"
      sha256 "6552a42104907bbbace27da19343998b3dd773ca42e7107bd5abc4ffb9743e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-linux-arm64"
      sha256 "8a1ae8c82971d9906400f05078ca069620082b1848bc5c81632a636252b928a3"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.4/aura-linux-amd64"
      sha256 "bf873feb197a7380571bdb172bae644eba028a5793153df37d2504bd946ba631"
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
