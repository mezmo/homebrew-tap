class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-darwin-arm64"
      sha256 "9ca5570b56a6b49a6a8c0ace900b70797c6ff4d1b7d54291f3803f09aa3c05a8"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-darwin-amd64"
      sha256 "1c595c202699a7523d2c5ca831a0e42a881605f6828c3bfb89703338b7e7e738"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-linux-arm64"
      sha256 "35b32a142ab3c8b69765cb9518f86be1a1071f0fc4ed473de953ce864bd92de3"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.19/aura-linux-amd64"
      sha256 "8b41e9af4c4436be1da84a4a79dd72e96c6684bd92ce32d0742105ea1843fb41"
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
