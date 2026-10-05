class AuraWebServer < Formula
  desc "OpenAI-compatible API server for AURA agents"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-web-server-darwin-arm64"
      sha256 "e0859034c0d7ab0514c7369a8d0924e77524c166cda864f4b05a1e54aa7585da"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-web-server-darwin-amd64"
      sha256 "b8490710c484a8ce27a8b0ffa0cf752c2b30ec988e9630e39a309e633e5b54af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-web-server-linux-arm64"
      sha256 "f59b9ce916a072906eb0d5bc2024f185f0fa88ab37e4340210c1df8fc77c43f6"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.18/aura-web-server-linux-amd64"
      sha256 "62dc76073258e554109111b86582ca9402a697c112285180d6a699f893635bcc"
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
