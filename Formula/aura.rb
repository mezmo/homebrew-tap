class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-arm64"
      sha256 "d54c89244d6778c7fee8578bf17ba8057fa61cd8dfe8ba607340ac2513ec6aa0"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-amd64"
      sha256 "99770d3262a7cfa5f9cef40cc1259b64cda88c7705bb3a0305a153920fe34e6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-arm64"
      sha256 "af5ea475061229b005dae35417ba4130633ea6a50dfe88acce531bde0e08c911"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-amd64"
      sha256 "6cd54107bcb90ef30a9666df3a823a0881b49fabef52e3fa85392735fba110a9"
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
