class Aura < Formula
  desc "Interactive terminal client for composing AI agents with MCP tools"
  homepage "https://github.com/mezmo/aura"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-darwin-arm64"
      sha256 "25d1bedddefe46cad84aab6a891196329322791dba57b7966f7d491eefb57994"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-darwin-amd64"
      sha256 "2311cf225dd6f3e37567d1577b34c0364701d036e20e58ccbaf9e59c0fdf21ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-linux-arm64"
      sha256 "66423c6aebfb15361198dc477ff845059f3d70f99fdad3660d1ab4dcf885bc4e"
    end
    on_intel do
      url "https://github.com/mezmo/aura/releases/download/v0.2.15/aura-linux-amd64"
      sha256 "81442b916c292b1cb8e0e70f1a355281ab736b55a38a711490d365e8117980d1"
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
