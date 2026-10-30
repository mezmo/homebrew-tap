class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-darwin-arm64"
      sha256 "8f891293e796dc874383ad1bd751201d209582064395febdb2fcbad626c5ef84"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-darwin-amd64"
      sha256 "8f9ac44366be340632a7475d9fc31ed5246db3f811be7aa49b9a5dee625ac59c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-linux-arm64"
      sha256 "3c58d8ff72d592debb8974d66fcfa56d6389a290dfe74a6ed546dc9a5e7cc67e"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.20/aura-linux-amd64"
      sha256 "f67208454b60b8088c2a48fbf1f61526a7fa3d637c04645740fb83e7b2c98401"
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
