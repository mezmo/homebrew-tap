class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-darwin-arm64"
      sha256 "92438db2b713493162667f826c77d69689c7c9b7ceae262e4af808617ecef49b"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-darwin-amd64"
      sha256 "3cbb504b7fe575744ce969239589aa4b1b36f400c6768134538674229b356048"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-linux-arm64"
      sha256 "07f92d8405dd4e09785cc3e97b29f0da127b4e41b1e01de8542572565143bdde"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.14/aura-linux-amd64"
      sha256 "37ae4ee623d265a88523640be2197d90c7c5914f88140ab6058103b41dcff2f1"
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
