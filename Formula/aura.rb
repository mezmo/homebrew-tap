class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-darwin-arm64"
      sha256 "0c6501be71536d5673d2013456d68fffde260682514e0c5764467e5d00171541"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-darwin-amd64"
      sha256 "cdc662dd99306abf73d8e42b8e925b4b5ff6a602d72b73c97e67f81f1517626d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-linux-arm64"
      sha256 "25726cb334b67148f0e8d9f0c9a1b7fc62b962d520bb2a90e57162a98dec7187"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.17/aura-linux-amd64"
      sha256 "c011585c9e2b595e22bf97e8e087efd57177d5f021bb802174db80ccacf29b55"
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
