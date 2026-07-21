class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-arm64"
      sha256 "5f9b695212c7932693ac66b1425a881a24ba1c74e42ac33c1d1e83d4392856da"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-darwin-amd64"
      sha256 "60f122d9a4a23a7344db41417b43a2881a0b110d26051e1a2d77350133b6dc28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-arm64"
      sha256 "4605bc14e9295420805d83b8e3e1eafaecd3d550811f35c2d404e61ad362648a"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v#{version}/aura-linux-amd64"
      sha256 "cf827cc7ec68fc8e91080f5558209dbc6fcbbc90d804f8b6ebb9233cb159715f"
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
