class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-web-server-darwin-arm64"
      sha256 "8a36b798d6f465cae2fc5401f5ce7f6d50b267e768b6c6070804c7ce42fc1e19"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-web-server-darwin-amd64"
      sha256 "07f33e64c9edc41354b677bd72c76453c46c461b9b307b1688594cdd44f346c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-web-server-linux-arm64"
      sha256 "bd2640ae191290ecdb2516b0003d1f2d71c4f5a7b91f71c4973d3b920fdd19c8"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.9/aura-web-server-linux-amd64"
      sha256 "b5708a55b80409ebb9cc2f364fd47cb365778c15f9e68fa77a66839be959e871"
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
