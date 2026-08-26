class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-web-server-darwin-arm64"
      sha256 "d62471eb3b5b8803dc6bf920ae6bd094e79cbfe6021732cc8ec93b6cfbd22534"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-web-server-darwin-amd64"
      sha256 "66bf39cd7a6369944a5a82050848123ec1e4fc34686133c0af83415c48977ac0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-web-server-linux-arm64"
      sha256 "7e8bbfbbdba27559bc4561049073fdd32fad35471c8d9005731bd8a63b670426"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.7/aura-web-server-linux-amd64"
      sha256 "9b2a34ae3d8e0871222b75838abecb453393cc45b82b7ed0d68727f1467628b8"
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
